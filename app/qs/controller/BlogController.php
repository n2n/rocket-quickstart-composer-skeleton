<?php

namespace qs\controller;

use n2n\web\http\controller\ControllerAdapter;
use n2n\reflection\annotation\AnnoInit;
use n2n\web\http\annotation\AnnoPath;
use qs\model\BlogDao;
use n2n\web\http\PageNotFoundException;
use qs\model\BlogCommentForm;

class BlogController extends ControllerAdapter {
	private static function _annos(AnnoInit $ai) {
		$ai->m('detail', new AnnoPath('/urlPart:*'));
	}
	
	private $blogDao;
	
	private function _init(BlogDao $blogDao) {
		$this->blogDao = $blogDao;
	}
	
	public function index() {
		// Artikel holen
		$blogArticles = $this->blogDao->getOnlineBlogArticles();
		// Artikel der View übergeben
		$this->forward('..\view\overview.html', array('blogArticles' => $blogArticles));
	}
	
	public function detail(string $urlPart) {
		// Artikel holen
		$blogArticle = $this->blogDao->getBlogArticleByUrlPart($urlPart);
		// prüfen, ob artikel gefunden
		if ($blogArticle === null) {
			throw new PageNotFoundException('Invalid urlPart: ' . $urlPart);
		}
	
		// Artikel weiterleiten
		$this->forward('~\view\detail.html', array('blogArticle' => $blogArticle));
	}
	
	public function doComment(int $blogId) {
		// Artikel holen über ID
		$blogArticle = $this->blogDao->getBlogArticleById($blogId);
		// Prüfen, ob Artikel gefunden
		if ($blogArticle === null) {
			throw new PageNotFoundException('invalid id: ' . $blogId);
		}
	
		$this->beginTransaction();
		$commentForm = new BlogCommentForm($blogArticle);
		if ($this->dispatch($commentForm, 'save')) {
			$this->commit();
			$this->redirectToController(array('thanks', $blogId));
			return;
		}
		$this->commit();
		 
		$this->forward('..\view\comment.html', array('commentForm' => $commentForm));
	}
	
	public function doThanks(int $blogId) {
		// Artikel holen über ID
		$blogArticle = $this->blogDao->getBlogArticleById($blogId);
		// prüfen, ob Artikel gefunden
		if ($blogArticle === null) {
			throw new PageNotFoundException('invalid id: ' . $blogId);
		}
		
		$this->forward('\qs\view\thanks.html', array('blogArticle' => $blogArticle));
	}
}


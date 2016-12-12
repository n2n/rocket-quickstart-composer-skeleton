<?php
namespace qs\model;

use n2n\context\RequestScoped;
use n2n\persistence\orm\EntityManager;
use qs\bo\BlogArticle;
use n2n\io\managed\File;
use qs\bo\BlogComment;

class BlogDao implements RequestScoped {

	private $em;

	private function _init(EntityManager $em) {
		$this->em = $em;
	}

	/**
	 * @return \qs3\bo\BlogArticle[]
	 */
	public function getOnlineBlogArticles() {
		$criteria = $this->em->createSimpleCriteria(BlogArticle::getClass(), array('online' => true),
				array('id' => 'DESC'));
		return $criteria->toQuery()->fetchArray();
	}

	/**
	 * @param string $urlPart
	 * @return \qs3\bo\BlogArticle
	 */
	public function getBlogArticleByUrlPart(string $urlPart){
		$criteria = $this->em->createSimpleCriteria(BlogArticle::getClass(), array('urlPart' => $urlPart));
		return $criteria->toQuery()->fetchSingle();
	}

	/**
	 * @param int $id
	 * @return \qs3\bo\BlogArticle
	 */
	public function getBlogArticleById(int $id) {
		return $this->em->find(BlogArticle::getClass(), $id);
	}

	/**
	 * @param BlogArticle $blogArticle
	 * @param string $email
	 * @param string $content
	 * @param File $image
	 */
	public function saveComment(BlogArticle $blogArticle, string $email, string $content, File $image = null) {
		$comment = new BlogComment();
		$comment->setBlogArticle($blogArticle);
		$comment->setEmail($email);
		$comment->setContent($content);
		$comment->setImage($image);
		$this->em->persist($comment);
	}
}
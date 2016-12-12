<?php

namespace qs\bo;

use n2n\persistence\orm\CascadeType;
use n2n\persistence\orm\annotation\AnnoOneToMany;
use n2n\persistence\orm\annotation\AnnoManyToMany;
use n2n\reflection\annotation\AnnoInit;
use n2n\reflection\ObjectAdapter;
use n2n\persistence\orm\annotation\AnnoOrderBy;

class BlogArticle extends ObjectAdapter {
	private static function _annos(AnnoInit $ai) {
		$ai->p('comments', new AnnoOneToMany(BlogComment::getClass(), 'blogArticle', CascadeType::ALL));
		$ai->p('comments', new AnnoOrderBy(array('id' => 'DESC')));
		$ai->p('categories', new AnnoManyToMany(BlogCategory::getClass(), null, 
				CascadeType::PERSIST|CascadeType::MERGE));
	}
	
	private $id;
	private $title;
	private $lead;
	private $contentHtml;
	private $urlPart;
	private $online;
	private $comments;
	private $categories;
	
	public function getId() {
		return $this->id;
	}

	public function setId($id) {
		$this->id = $id;
	}

	public function getTitle() {
		return $this->title;
	}

	public function setTitle($title) {
		$this->title = $title;
	}

	public function getLead() {
		return $this->lead;
	}

	public function setLead($lead) {
		$this->lead = $lead;
	}

	public function getContentHtml() {
		return $this->contentHtml;
	}

	public function setContentHtml($contentHtml) {
		$this->contentHtml = $contentHtml;
	}

	public function getUrlPart() {
		return $this->urlPart;
	}

	public function setUrlPart($urlPart) {
		$this->urlPart = $urlPart;
	}

	public function isOnline() {
		return $this->online;
	}

	public function setOnline(bool $online) {
		$this->online = $online;
	}
	
	/**
	 * @return \qs\bo\BlogComment[]
	 */
	public function getComments() {
		return $this->comments;
	}
	
	/**
	 * @param \qs\bo\BlogComment[]
	 */
	public function setComments(\ArrayObject $comments) {
		$this->comments = $comments;
	}
	
	/**
	 * @return \qs\bo\BlogCategory[]
	 */
	public function getCategories() {
		return $this->categories;
	}
	
	/**
	 * @param \qs\bo\BlogCategory[]
	 */
	public function setCategories(\ArrayObject $categories) {
		$this->categories = $categories;
	}

}

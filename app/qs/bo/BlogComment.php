<?php

namespace qs\bo;

use n2n\persistence\orm\CascadeType;
use n2n\reflection\ObjectAdapter;
use n2n\reflection\annotation\AnnoInit;
use n2n\persistence\orm\annotation\AnnoManyToOne;
use n2n\io\managed\File;
use n2n\persistence\orm\annotation\AnnoManagedFile;

class BlogComment extends ObjectAdapter {
	private static function _annos(AnnoInit $ai) {
		$ai->p('blogArticle', new AnnoManyToOne(BlogArticle::getClass(), CascadeType::MERGE|CascadeType::PERSIST));
		$ai->p('image', new AnnoManagedFile());
	}
	
	private $id;
	private $blogArticle;
	private $email;
	private $image;
	private $content;
	private $created;

	public function __construct() {
		$this->setCreated(new \DateTime());
	}
	
	public function getId() {
		return $this->id;
	}

	public function setId($id) {
		$this->id = $id;
	}

	/**
	 * @return BlogArticle
	 */
	public function getBlogArticle() {
		return $this->blogArticle;
	}

	/**
	 * @param BlogArticle $blogArticle
	 */
	public function setBlogArticle(BlogArticle $blogArticle) {
		$this->blogArticle = $blogArticle;
	}

	public function getEmail() {
		return $this->email;
	}

	public function setEmail($email) {
		$this->email = $email;
	}

	/**
	 * @return File $image
	 */
	public function getImage() {
		return $this->image;
	}

	/**
	 * @param File $image
	 */
	public function setImage(File $image = null) {
		$this->image = $image;
	}

	public function getContent() {
		return $this->content;
	}

	public function setContent($content) {
		$this->content = $content;
	}
	
	/**
	 * @return \DateTime
	 */
	public function getCreated() {
		return $this->created;
	}
	
	/**
	 * @param \DateTime $created
	 */
	public function setCreated(\DateTime $created) {
		$this->created = $created;
	}
	
}

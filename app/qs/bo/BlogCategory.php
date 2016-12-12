<?php

namespace qs\bo;

use n2n\persistence\orm\CascadeType;
use n2n\reflection\ObjectAdapter;
use n2n\reflection\annotation\AnnoInit;
use n2n\persistence\orm\annotation\AnnoManyToMany;

class BlogCategory extends ObjectAdapter {
	private static function _annos(AnnoInit $ai) {
		$ai->p('articles', new AnnoManyToMany(BlogArticle::getClass(), 'categories', 
				CascadeType::PERSIST|CascadeType::MERGE));
	}
	
	private $id;
	private $name;
	private $articles;

	public function getId() {
		return $this->id;
	}

	public function setId($id) {
		$this->id = $id;
	}

	public function getName() {
		return $this->name;
	}

	public function setName($name) {
		$this->name = $name;
	}
	
	public function getArticles() {
		return $this->articles;
	}
	
	public function setArticles(\ArrayObject $articles) {
		$this->articles = $articles;
	}
}
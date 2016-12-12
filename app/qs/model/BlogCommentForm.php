<?php
namespace qs\model;

use n2n\web\dispatch\Dispatchable;
use qs\bo\BlogArticle;
use n2n\web\dispatch\map\bind\BindingDefinition;
use n2n\impl\web\dispatch\map\val\ValNotEmpty;
use n2n\impl\web\dispatch\map\val\ValEmail;
use n2n\impl\web\dispatch\map\val\ValImageFile;
use n2n\io\managed\File;
use n2n\web\dispatch\map\MappingResult;

class BlogCommentForm implements Dispatchable {
	private $blogArticle;
	
	protected $email;
	protected $image;
	protected $content;
	 
	public function __construct(BlogArticle $blogArticle) {
		$this->blogArticle = $blogArticle;
	}
	 
	public function getBlogArticle() {
		return $this->blogArticle;
	}

	public function getEmail() {
		return $this->email;
	}

	public function setEmail(string $email) {
		$this->email = $email;
	}

	public function getImage() {
		return $this->image;
	}

	public function setImage(File $image = null) {
		$this->image = $image;
	}

	public function getContent() {
		return $this->content;
	}

	public function setContent(string $content) {
		$this->content = $content;
	}

	private function _mapping(MappingResult $mr) {
		$mr->setLabel('email', 'E-Mail');
		$mr->setLabel('content', 'Dein Kommentar');
		$mr->setLabel('image', 'Dein Bild');
	}
	 
	private function _validation(BindingDefinition $bd) {
		$bd->val(array('content', 'email'), new ValNotEmpty());
		$bd->val('email', new ValEmail());
		$bd->val('image', new ValImageFile(true));
	}

	public function save(BlogDao $blogDao) {
		$blogDao->saveComment($this->blogArticle, $this->email, $this->content, $this->image);
	}
	 
}

<?php
	use n2n\impl\web\ui\view\html\HtmlView;
	use qs\model\BlogCommentForm;
	
	$view = HtmlView::view($this);
	$formHtml = HtmlView::formHtml($view);
	 
	$commentForm = $view->getParam('commentForm');
	$view->assert($commentForm instanceof BlogCommentForm);
	 
	$view->useTemplate('boilerplate.html', array('title' => 'Dein Kommentar'));
 
?>
<h1>Kommentieren</h1>
 
<?php $formHtml->open($commentForm) ?>
    <?php $formHtml->messageList() ?>
    <div>
        <?php $formHtml->label('email') ?><br />
        <?php $formHtml->input('email', array('maxlength' => 120)) ?>
    </div>
    <div>
        <?php $formHtml->label('content') ?><br />
        <?php $formHtml->textarea('content', array('rows' => 5, 'cols' => 30)) ?>
    </div>
    <div>
        <?php $formHtml->label('image')?><br />
        <?php $formHtml->inputFileWithLabel('image') ?>
    </div>
     
    <?php $formHtml->buttonSubmit('save', 'Kommentar speichern')?>
<?php $formHtml->close() ?>
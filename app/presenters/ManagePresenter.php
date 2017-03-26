<?php

namespace App\Presenters;

use Nette;
use App\Forms\ManageFormFactory;


class ManagePresenter extends Nette\Application\UI\Presenter
{
	/** @var Nette\Database\Context */
	private $database;

	/** @var ManageFormFactory @inject */
	public $factory;

	public function __construct(Nette\Database\Context $database)
	{
		$this->database = $database;
	}


	protected function createComponentManageDataForm(){
		$form = $this->factory->create('a');
		$form->onSuccess[] = [$this, "formSucceeded"];
		return $form;
	}

	public function renderDefault($sid = "")
	{
		$result = $this->database->table('v_getuserinfo')->where("serial_number", $sid);
		
		if(isset($result[0])){
			$this->template->userInfo = $result[0];
			$session = $this->getSession('BASE');
			$session->sid = $sid;
		}
		
	}

	public function renderChargePoint(){

	}

	public function formSucceeded(Nette\Application\UI\Form $form){

		$formValues = $form->getValues(true);

		$result = $this->database->query('INSERT INTO transaction', array( // parametr může být pole
			    'points' => $formValues['pointsForm'],
			    'session_id' => 1));
	}

}

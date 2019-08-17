<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	public function index()
	{
		$this->load->model("courses_model");
		$courses = $this->courses_model->show_course();

		$this->load->model("team_model");
		$team = $this->team_model->show_member();


		$data = array(
			"scripts" => array(
				"owl.carousel.min.js",
				"cbpAnimatedHeader.js",
				"theme-scripts.js"
			),
			"courses" => $courses,
			"team" => $team,
		);
		$this->template->show("home.php", $data);
	}
}



<?php

class Courses_model extends CI_Model {

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}


	public function show_course() {
		$this->db->from("courses");
		return $this->db->get()->result_array();
	}


	#Consulta/Busca
	public function get_data($id, $select = NULL) {
		if (!empty($select)) {
			$this->db->select($select);
		}
		$this->db->from("courses");
		$this->db->where("course_id", $id);
		return $this->db->get();
	}

	#Inserção/Criação
	public function insert($data) {
		$this->db->insert("courses", $data);
	}

	#Alteração/Atualização
	public function update($id, $data) {
		$this->db->where("course_id", $id);
		$this->db->update("courses", $data);
	}

	#Deleção/Exclusão
	public function delete($id, $select = NULL) {
		$this->db->where("course_id", $id);
		$this->db->delete("courses");
	}

	public function is_duplicated($field, $value, $id = NULL) {
		if (!empty($id)) {
			$this->db->where("course_id <>", $id);
		}
		$this->db->from("courses");
		$this->db->where($field, $value);
		return $this->db->get()->num_rows() > 0;
	}


	/* CAMPOS VIA POST
		$_POST['search']['value'] = Campo para busca
		$_POST['order'] = [[0, 'asc']] 
			$_POST['order'][0]['column'] = Index da coluna
			$_POST['order'][0]['dir'] = Tipo de ordenação (asc, desc)
		$_POST['length'] = Quantos campos mostrar
		$_POST['start'] =  Qual posição começar
	*/

	//Busca
	var $column_search = array("course_name", "course_description");
	//Ordenação
	var $column_order = array("course_name", "", "course_duration");

	private function _get_datatable() {

		$search = NULL;
		if ($this->input->post("search")) {
			$search = $this->input->post("search")["value"];
		}
		$order_column = NULL;
		$order_dir = NULL;
		$order = $this->input->post("order");
		if (isset($order)) {
			$order_column = $order[0]["column"];
			$order_dir = $order[0]["dir"];
		}

		$this->db->from("courses");
		if (isset($search)) {
			$first = TRUE;
			foreach ($this->column_search as $field) {
				if ($first) {
					$this->db->group_start();
					$this->db->like($field, $search);
					$first = FALSE;
				} else {
					$this->db->or_like($field, $search);
				}
			}
			if (!$first) {
				$this->db->group_end();
			}
		}

		if (isset($order)) {
			$this->db->order_by($this->column_order[$order_column], $order_dir);
		}
	}

	public function get_datatable() {

		//Paginação
		$length = $this->input->post("length");
		$start = $this->input->post("start");
		$this->_get_datatable();
		if (isset($length) && $length != -1) {
			$this->db->limit($length, $start);
		}
		return $this->db->get()->result();
	}

	//Itens filtrados
	public function records_filtered() {

		$this->_get_datatable();
		return $this->db->get()->num_rows();

	}

	//Total de resultados
	public function records_total() {

		$this->db->from("courses");
		return $this->db->count_all_results();
	}
}

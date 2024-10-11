<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\HTTP\ResponseInterface;

use App\Models\ProductModel;

class Workflow_Product extends BaseController
{
    protected $db;
    protected $model;

    public function __construct()
    {
        $this->db = db_connect();
        $this->model = new ProductModel;
    }

    public function getProduct(){        
        $builder = $this->db->table('product_tbl');
                    $builder->select('
                    product_tbl.product_id as id,
                    product_tbl.pet_id as pet_id,
                    product_tbl.brand_id as brand_id,
                    product_tbl.breed_id as breed_id,
                    product_tbl.product_type_id as product_type_id,
                    product_tbl.product_category_id as product_category_id,
                    product_tbl.name as name,
                    product_tbl.summery as summery,
                    product_tbl.description as description,
                    product_tbl.instruction as instruction,
                    pet_tbl.pet_name as pet_name,
                    brand_tbl.brand_name as brand_name,
                    breed_tbl.breed_name as breed_name,
                    product_type_tbl.type as type,
                    product_category_tbl.category as category
                    ');
                    $builder->join('pet_tbl', 'product_tbl.pet_id = pet_tbl.pet_id', 'inner');
                    $builder->join('product_type_tbl', 'product_tbl.product_type_id = product_type_tbl.product_type_id', 'inner');
                    $builder->join('product_category_tbl', 'product_tbl.product_category_id = product_category_tbl.product_category_id', 'inner');
                    $builder->join('brand_tbl', 'product_tbl.brand_id = brand_tbl.brand_id ', 'inner');
                    $builder->join('breed_tbl', 'product_tbl.breed_id = breed_tbl.breed_id', 'inner');
                    $builder->where('product_tbl.flag=1');
                    $data = $builder->get();
                    $data =$data->getResult();



        if($data){
            echo $this->response_message([
                'code' => 200,
                'data' => json_encode($data)
            ]); return;
        }
        echo $this->response_message(false, false);
    }





    public function insertProduct(){
        $request = \Config\Services::request();
        $data =  $request->getPost();
        $filepath = '';



        $product_check = $this->model->where(array( 'brand_id' => $data['brand_id'], 'breed_id' => $data['breed_id'], 'product_type_id' => $data['product_type_id'], 'product_category_id' => $data['product_category_id'], 'name' => $data['name'],  'flag' => 1 ))->first();
        if(!$product_check){

            if($data && $this->model->insert($data, false)){
                echo $this->response_message([
                    'code' => 200,
                    'msg' => "Product inserted successfully!"
                ]); return;
            }
            echo $this->response_message(false, false);
        }
        else{
            echo $this->response_message([
                'code' => 400,
                'msg' => "Product name is already there try another name!"
            ]); return;
        }
    }


    public function updateProduct(){

        $request = \Config\Services::request();
        $data =  $request->getPost();
        $filepath = '';
        $updatedData=[];

      
        $product_check = $this->model->where(array('
        
        product_id !=' => $data['product_id'],
        'name =' => $data['name'],
        'brand_id =' => $data['brand_id'],
        'breed_id =' => $data['breed_id'],
        'pet_id =' => $data['pet_id'],
        'product_category_id =' => $data['product_category_id'], 
        'product_type_id =' => $data['product_type_id'],
        'flag' => 1 ))->first();

           



        if(!$product_check){
        $product_id_check = $this->model->where('product_id', $data['product_id'])->first();




        if($product_id_check){
            $updatedData['product_id']=$data['product_id'];

            $updatedData['brand_id']=$data['brand_id'];
            $updatedData['pet_id']=$data['pet_id'];
            $updatedData['breed_id']=$data['breed_id'];
            $updatedData['product_type_id']=$data['product_type_id'];
            $updatedData['product_category_id']=$data['product_category_id'];
            $updatedData['name']=$data['name'];
            $updatedData['summery']=$data['summery'];
            $updatedData['description']=$data['description'];
            $updatedData['instruction']=$data['instruction'];
            $update = $this->model->save($updatedData);
            if($data && $update){
                if($this->model->db->affectedRows()){
                    echo $this->response_message([
                        'code' => 200,
                        'msg' => "Pet updated successfully!"
                    ]); return;
                } else{
                    echo $this->response_message([
                        'code' => 400,
                        'msg' => "No changes"
                    ]); return;
                }
            }
            echo $this->response_message(false, false);
        }
        echo $this->response_message(false, false);

    }else{
        echo $this->response_message([
            'code' => 400,
            'msg' => "Product name is already there try another name!"
        ]); return;
    }
    }


    public function deleteProduct(){

        $request = \Config\Services::request();
        $data =  $request->getPost();
        

        $data['flag']=0;
        if($data && $this->model->save($data)){
            echo $this->response_message([
                'code' => 200,
                'msg' => "Product Type deleted successfully!"
            ]); return;
        }

        echo $this->response_message(false, false);
    }

    
}
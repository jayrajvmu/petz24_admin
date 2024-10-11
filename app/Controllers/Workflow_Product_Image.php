<?php

namespace App\Controllers;
use CodeIgniter\Files\File;

use App\Models\ProductImageModel;

class Workflow_Product_Image extends BaseController
{

    public function __construct()
    {
        
        $this->db = db_connect();
        $this->model = new ProductImageModel;
        
    }

    public function getProductImage(){
        $builder = $this->db->table('product_img_tbl');
        $builder->select('*');
        $builder->join('product_tbl', 'product_tbl.product_id = product_img_tbl.product_id');
        $builder->where('product_img_tbl.flag=1');
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



public function insertProductImage(){


        $request = \Config\Services::request();
        $data =  $request->getPost();
        $filepath = '';

            if($_FILES['url']['name'] != ''){
                $img = $this->request->getFile('url');
                if (!$img->hasMoved()) {
                    $newName = $img->getRandomName(); // Generate a random file name
                    $img->move('uploads/product', $newName); // Move the file to the uploads directory
                    $data['url']= 'uploads/product/'.$newName;          
                }
            }
            if($data && $this->model->insert($data, false)){
                echo $this->response_message([
                    'code' => 200,
                    'msg' => "Product Image inserted successfully!"
                ]); return;
            }
            echo $this->response_message(false);

    }
    


    public function updateProductImage(){

        $request = \Config\Services::request();
        $data =  $request->getPost();
        $filepath = '';     
        $data['url']='';   


        $product_check = $this->model->where('product_img_id', $data['product_img_id'])->first();
        $data['url']=$product_check['url']; 

         if($product_check){
            if($_FILES['url']['name'] != ''){
                $old_img=$product_check['url'];
                $img = $this->request->getFile('url');
                if (!$img->hasMoved()) {
                    $newName = $img->getRandomName(); // Generate a random file name
                    $img->move('uploads/product', $newName); // Move the file to the uploads directory
                    $data['url']= 'uploads/product/'.$newName; 
                    
                    if (file_exists($old_img)) {
                        unlink($old_img); // This will delete the file from the server
                    }
                }
                }
                $newData['product_img_id']=$data['product_img_id'];
                $newData['product_id']=$data['product_id'];
                $newData['url']=$data['url'];
                
                $update = $this->model->save($newData);

            if($newData && $update){
                if($this->model->db->affectedRows()){
                    echo $this->response_message([
                        'code' => 200,
                        'msg' => "Brand updated successfully!"
                    ]); return;
                } else{
                    echo $this->response_message([
                        'code' => 400,
                        'msg' => "No changes"
                    ]); return;
                }
            }
        }
        echo $this->response_message(false);
    }


    public function deleteProductImage(){
        $request = \Config\Services::request();
        $data =  [
            'product_img_id' => $request->getPost('product_img_id'),
            'flag' => 0
        ];

        $delete_product_img =   $request->getPost('product_img');
        $delete = $this->model->save($data);

        if($delete){

            if($this->model->db->affectedRows()){

                if (file_exists($delete_product_img)) {
                    unlink($delete_product_img); // This will delete the file from the server
                }
                echo $this->response_message([
                    'code' => 200,
                    'msg' => "Pet deleted successfully!"
                ]); return;
            }
        }
        echo $this->response_message(false);
    }
}
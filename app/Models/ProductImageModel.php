<?php
namespace App\Models;
use CodeIgniter\Model;

class ProductImageModel extends Model{
    protected $table = 'product_img_tbl';
    protected $primaryKey = 'product_img_id';
    protected $allowedFields = [
        'product_img_id',
        'product_id',
        'url',
        'flag'
    ];
}
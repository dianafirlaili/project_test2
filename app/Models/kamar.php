<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class kamar extends Model
{
    public $table = "kamar";

    use SoftDeletes;
    use HasFactory;

    protected $fillable = [
        'nama',
        'kategori',
        'status',
    ];
}

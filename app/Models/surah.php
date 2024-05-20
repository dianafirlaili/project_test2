<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class surah extends Model
{
    public $table = "surah";

    use HasFactory;

    protected $fillable = [
        'id',
        'nama',
        'ayat',
        'juz',
    ];
}

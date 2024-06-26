<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class hafalan extends Model
{
    public $table = "hafalan";

    use SoftDeletes;
    use HasFactory;

    protected $fillable = [
        'santri_id',
        'tanggal',
        'tes',
        'surah_id',
        'ayat',
        'makhroj',
        'tajwid',
        'nilai_hs',
        'nilai_kb',

    ];
}

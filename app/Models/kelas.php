<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class kelas extends Model
{
    public $table = "kelas";

    use HasFactory;

    protected $fillable = [
        'tingkatan',
        'tapel_id',
        'suffix',
        'guru_id',
    ];

    // Di dalam model Kelas
    public function guru()
    {
        return $this->belongsTo('App\Models\guru');
    }

    public function tapel()
    {
        return $this->belongsTo('App\Models\tapel');
    }

    public function siswa()
    {
        return $this->hasMany('App\Models\siswa');
    }
}

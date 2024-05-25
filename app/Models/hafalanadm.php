<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class hafalanadm extends Model
{
    public $table = "hafalanadm";

    use SoftDeletes;
    use HasFactory;

    protected $fillable = [
        'surah',
        'kelas_id',
    ];

    public function kelas()
    {
        return $this->belongsTo(Kelas::class, 'kelas_id');
    }
}

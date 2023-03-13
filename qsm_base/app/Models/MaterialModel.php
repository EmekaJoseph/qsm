<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class MaterialModel extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'tbl_materials';
    protected $primaryKey = 'material_id';

    protected $fillable = [
        'caterogy_id',
        'pages',
        'material_code',
        'doc',
        'name',
        'created_at',
        'updated_at',
    ];
}

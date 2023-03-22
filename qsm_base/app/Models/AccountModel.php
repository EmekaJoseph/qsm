<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Concerns\HasUlids;

class AccountModel extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
    use HasUlids;

    protected $table = 'tbl_account';
    protected $primaryKey = 'id';

    protected $fillable = [
        'username',
        'password',
        'role',
        'last_login',
    ];

    protected $hidden = [
        'password',
    ];

    public $timestamps = false;
}

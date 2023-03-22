<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class BlogModel extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
    use HasUuids;

    protected $table = 'tbl_blog';
    protected $primaryKey = 'blog_id';

    protected $fillable = [
        'title',
        'text',
        'images',
        'category',
    ];
}

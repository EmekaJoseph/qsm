<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Concerns\HasUlids;

class TrainingModel extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
    use HasUlids;

    protected $table = 'tbl_trainings';
    protected $primaryKey = 'id';
    protected $guarded = [];

    // protected $fillable = [
    //     'title',
    //     'info',
    //     'price',
    //     'image',
    //     'start_date',
    //     'end_date',
    //     'venue',
    // ];
}

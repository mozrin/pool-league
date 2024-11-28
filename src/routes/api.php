<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\UserController;

Route::get('/users', [UserController::class, 'indexUsers']);
Route::get('/users/profiles', [UserController::class, 'indexUsersWithProfiles']);

Route::apiResource('user', UserController::class);

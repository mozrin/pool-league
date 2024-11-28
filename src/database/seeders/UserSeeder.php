<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */

    public function run()
    {
        // Create one specific known user

        User::factory()->create([
            'name' => 'Mozrin',
            'email' => 'mozrin@mozrin.com',
            'password' => bcrypt('password'), // Ensure you hash the password
        ]);

        // Create 99 random users

        User::factory(99)->create();
    }
}

<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class SuperAdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Creating Super Admin User
        $superAdmin = User::firstOrCreate(
            ['email' => 'admin@minispro.local'],
            [
                'name' => 'minispro',
                'password' => Hash::make('minispro'),
            ]
        );
        $superAdmin->assignRole('Super Admin');
    }
}

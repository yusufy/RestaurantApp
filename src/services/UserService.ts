import { pool } from '../config/database';
import { User } from '../models/User';

export class UserService {
  async getAllUsers(): Promise<User[]> {
    const result = await pool.query('SELECT * FROM users');
    return result.rows;
  }

  async getUserById(id: number): Promise<User | null> {
    const result = await pool.query('SELECT * FROM users WHERE id = $1', [id]);
    return result.rows[0] || null;
  }

  async createUser(user: Omit<User, 'id' | 'createdAt'>): Promise<User> {
    const result = await pool.query(
      'INSERT INTO users (name, email, created_at) VALUES ($1, $2, NOW()) RETURNING *',
      [user.name, user.email]
    );
    return result.rows[0];
  }
} 
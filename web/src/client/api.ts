import { treaty } from '@elysiajs/eden';
import type { App } from '../server/index';

// End-to-End Type-Safe Eden Treaty client bound directly to Elysia App type
const baseUrl =
  typeof window !== 'undefined' ? window.location.origin : 'http://127.0.0.1:3000';

export const api = treaty<App>(baseUrl);

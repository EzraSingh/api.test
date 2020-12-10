import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { AppController } from './app.controller';
import { AppService } from './app.service';

@Module({
  imports: [
    MongooseModule.forRoot('mongodb://localhost:6000', {
      useNewUrlParser: true,
      keepAlive: true,
      user: 'app',
      pass: 'dev',
      connectionName: 'test'
    })
  ],
  controllers: [AppController],
  providers: [AppService]
})
export class AppModule { }

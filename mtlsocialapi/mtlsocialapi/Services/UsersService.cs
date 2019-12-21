using MongoDB.Driver;
using mtlsocialapi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace mtlsocialapi.Services
{
    public class UsersService
    {
        private readonly IMongoCollection<Users> _users;

        public UsersService(IMTLSocialStoreDbSetting settings)
        {
            var client = new MongoClient(settings.ConnectionString);
            var database = client.GetDatabase(settings.DatabaseName);

            _users = database.GetCollection<Users>(settings.UsersCollectionName);
        }

        public List<Users> Get() =>
            _users.Find(Todo => true).ToList();

        public Users Get(string id) =>
            _users.Find<Users>(Todo => Todo.Id == id).FirstOrDefault();

        public Users Create(Users Todo)
        {
            _users.InsertOne(Todo);
            return Todo;
        }

        public void Update(string id, Users TodoIn) =>
            _users.ReplaceOne(Todo => Todo.Id == id, TodoIn);

        public void Remove(Users TodoIn) =>
            _users.DeleteOne(Todo => Todo.Id == TodoIn.Id);

        public void Remove(string id) =>
            _users.DeleteOne(Todo => Todo.Id == id);
    }
}

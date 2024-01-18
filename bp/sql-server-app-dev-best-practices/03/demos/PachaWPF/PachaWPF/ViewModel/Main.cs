using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PachaWPF.ViewModel
{
    internal class ContactResult
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string City { get; set; }
        public int Enrollments { get; set; }
    }

    internal class Main : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public ObservableCollection<Data.Contact> SearchContact(string LastName)
        {
            using (var ctx = new Data.CodeFirst())
            {
                var res = ctx.Contacts.Where(c => c.LastName.Contains(LastName));
                res.Load();
                return new ObservableCollection<Data.Contact>(res);
            }
        }

        public List<ContactResult> SearchContactWithEnrollments(string LastName)
        {
            using (var ctx = new Data.CodeFirst())
            {
                var res = from c in ctx.Contacts
                          where c.LastName.Contains(LastName)
                          join a in ctx.Addresses on c.AddressId equals a.AddressId
                          select new ContactResult
                          {
                              FirstName = c.FirstName,
                              LastName = c.LastName,
                              City = a.City.Name,
                              Enrollments = c.Enrollments.Count()
                          };
                res.Load();
                return res.Take(10).ToList();
            }
        }

        public List<ContactResult> SearchContactWithEnrollmentsBad(string LastName)
        {
            var l = new List<ContactResult>();

            using (var ctx = new Data.CodeFirst())
            {
                var res = (from c in ctx.Contacts
                          where c.LastName.Contains(LastName)
                          join a in ctx.Addresses on c.AddressId equals a.AddressId
                          select new {a, c}
                    );
                foreach (var c in res)
                {
                    System.Threading.Thread.Sleep(100);
                    l.Add(new ContactResult
                    {
                        FirstName = c.c.FirstName,
                        LastName = c.c.LastName,
                        City = c.a.City.Name,
                        Enrollments = c.c.Enrollments.Count()
                    });
                }
            }
            return l;
        }

        public void InsertContacts()
        {
            var c1 = new Data.Contact
            {
                FirstName = "Marie",
                LastName = "Boguel"
            };
            var c2 = new Data.Contact
            {
                FirstName = "Shirley",
                LastName = "Del Toro"
            };

            using (var ctx = new Data.CodeFirst())
            {
                ctx.Contacts.Add(c1);
                ctx.Contacts.Add(c2);
                ctx.SaveChanges();
            }
        }
    }
}

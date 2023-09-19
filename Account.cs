using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_2
{
    class Account
    {
        private int accountID;
        private string firstName;
        private string lastName;
        private decimal balance;

        public int AccountID { get => accountID; set => accountID = value; }
        public string FirstName { get => firstName; set => firstName = value; }
        public string LastName { get => lastName; set => lastName = value; }
        public decimal Balance { get => balance; set => balance = value; }

        public Account() { }
        public Account(int aID, string fName, string lName, decimal bl)
        {
            this.accountID = aID;
            this.firstName = fName;
            this.lastName = lName;
            this.balance = bl;
        }

        public void Show()
        {
            Console.WriteLine("--------------------------");
            Console.WriteLine("Account ID:" + accountID);
            Console.WriteLine("First Name:" + firstName);
            Console.WriteLine("Last Name:" + lastName);
            Console.WriteLine("Balance:" + balance);
            Console.WriteLine("--------------------------");
        }
        public void Input()
        {
            Console.Write("Input account ID: ");
            accountID = int.Parse(Console.ReadLine());
            Console.Write("Input first name: ");
            firstName = Console.ReadLine();
            Console.Write("Input last name: ");
            lastName = Console.ReadLine();
            Console.Write("Input balance: ");
            balance = decimal.Parse(Console.ReadLine());
        }
    }
    class AccoutIDComparer : IComparer
    {
        int IComparer.Compare(object a, object b)
        {
            Account x = (Account)a;
            Account y = (Account)b;
            if (x == null) return -1;
            if (y == null) return 1;
            if (ReferenceEquals(x, y)) return 0;
            return x.AccountID == y.AccountID ? 0 : x.AccountID > y.AccountID ? 1 : -1;
        }
    }
    class FirstNameComparer : IComparer
    {
        int IComparer.Compare(object a, object b)
        {
            Account x = (Account)a;
            Account y = (Account)b;
            if (x == null) return -1;
            if (y == null) return 1;
            if (ReferenceEquals(x, y)) return 0;
            return String.Compare(x.FirstName, y.FirstName);
        }
    }
    class BalanceComparer : IComparer
    {
        int IComparer.Compare(object a, object b)
        {
            Account x = (Account)a;
            Account y = (Account)b;
            if (x == null) return -1;
            if (y == null) return 1;
            if (ReferenceEquals(x, y)) return 0;
            return x.Balance == y.Balance ? 0 : x.Balance > y.Balance ? 1 : -1;
        }
    }
    class AccountList
    {
        private ArrayList list = new ArrayList();
        public void NewAccount()
        {
            Account a = new Account();
            a.Input();
            list.Add(a);
        }
        public void SaveFile()
        {
            Console.Write("Input file name to save: ");
            string fileName = Console.ReadLine();
            try
            {
                FileStream output = new FileStream(fileName, FileMode.CreateNew, FileAccess.Write);
                StreamWriter writer = new StreamWriter(output);
                foreach (Account a in list)
                {
                    writer.WriteLine("{0},{1},{2},{3}", a.AccountID, a.FirstName, a.LastName, a.Balance);
                }
                writer.Close();
                output.Close();
            }
            catch (IOException e)
            {
                Console.WriteLine(e.Message);
            }
        }
        public void LoadFile()
        {
            Console.Write("Input file name to load: ");
            string fileName = Console.ReadLine();
            list.Clear();
            try
            {
                FileStream input = new FileStream(fileName, FileMode.Open, FileAccess.Read);
                StreamReader reader = new StreamReader(input);
                string str;
                while ((str = reader.ReadLine()) != null)
                {
                    string[] l = str.Split(',');
                    Account a = new Account(int.Parse(l[0]), l[1], l[2], decimal.Parse(l[3]));
                    list.Add(a);
                }
                input.Close();
                reader.Close();
            }
            catch (IOException e)
            {
                Console.WriteLine(e.Message);
            }
        }
        public void Report()
        {
            Console.WriteLine("*******List account*******");
            foreach (Account a in list)
            {
                a.Show();
            }
            Console.WriteLine("**************************");
        }
        public void InputList()
        {
            int n;
            Console.Write("Number of accounts: ");
            n = int.Parse(Console.ReadLine());
            while (n > 0)
            {
                NewAccount();
                n--;
            }
        }
        public int RemoveAccount()
        {
            int id;
            Console.Write("Input account ID to remove: ");
            id = int.Parse(Console.ReadLine());
            //list.Sort();
            Account tmp = new Account();
            tmp.AccountID = id;
            int index = list.BinarySearch(tmp, new AccoutIDComparer());
            if (index < 0)
            {
                Console.WriteLine("Account ID not in list!");
                return 0;
            }
            else
            {
                list.RemoveAt(index);
                Console.WriteLine("Remove success!!! ");
                return 1;
            }
        }
        public void SortByAccountID()
        {
            Console.WriteLine("Sort by account ID");
            list.Sort(new AccoutIDComparer());
        }
        public void SortByFirstName()
        {
            Console.WriteLine("Sort by first name");
            list.Sort(new FirstNameComparer());
        }
        public void SortByBalance()
        {
            Console.WriteLine("Sort by balance");
            list.Sort(new BalanceComparer());
        }
    }
    class Program3and4
    {
        public static void Main(string[] args)
        {
            AccountList accounts = new AccountList();
            accounts.InputList();
            accounts.Report();
            accounts.SaveFile();
            accounts.LoadFile();
            accounts.Report();
            accounts.RemoveAccount();
            accounts.Report();
            accounts.SortByAccountID();
            accounts.Report();
            accounts.SortByFirstName();
            accounts.Report();
            accounts.SortByBalance();
            accounts.Report();
        }
    }
}

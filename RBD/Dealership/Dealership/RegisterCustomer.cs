using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace Dealership
{
    public partial class RegisterCustomer : Form
    {
        public string myConnection = "datasource=127.0.0.1;database=MDWally;port=3306;username=root;password=canada2018!;sslmode=none";
        public RegisterCustomer()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Owner.Show();
            this.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int customerID = 0;
            string firstName = "";
            const string query = @"INSERT INTO `tCustomers` (`customerID`, `firstName`, `lastName`, `phoneNumber`) VALUES
            (@customerID, '', 'Wally's World of Wheels Inc.', '519-555-0000');";

            using (var myConn = new MySqlConnection(myConnection))
            {
                var myCommand = new MySqlCommand(query, myConn);
                myCommand.Parameters.AddWithValue("@customerID", customerID);
                myCommand.Parameters.AddWithValue("", firstName);
                myCommand.Parameters.AddWithValue("@phoneNumber", customerID);
                //Data reader example. Connection must be opened. 
                myConn.Open();
            }
        }
    }
    }

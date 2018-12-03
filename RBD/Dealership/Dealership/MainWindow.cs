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
    public partial class MainWindow : Form
    {
        public string myConnection = "datasource=127.0.0.1;database=MDWally;port=3306;username=root;password=canada2018!;sslmode=none";

        public MainWindow()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            RegisterCustomer menuForCustomer = new RegisterCustomer();
            menuForCustomer.Owner = this;
            menuForCustomer.Show();
            this.Hide();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            PlaceOrder menuForCustomer = new PlaceOrder();
            menuForCustomer.Owner = this;
            menuForCustomer.Show();
            this.Hide();
        }
    }
}

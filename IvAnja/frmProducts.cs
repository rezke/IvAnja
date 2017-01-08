using DAL;
using Domain;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace IvAnja
{
    public partial class frmProducts : Form
    {
        IvAnjaEntities _context;
        private List<Ingredient> ingredients = new List<Ingredient>();
        BindingSource ingredientsBindingSource = new BindingSource();
        public frmProducts()
        {
            InitializeComponent();
            _context = new IvAnjaEntities();
            _context.Ingredients.Load();
            InitializeComponent();

            ingredients  = _context.Ingredients.ToList();
            ingredientsBindingSource.DataSource = ingredients;
            cbIngredients.DataSource = ingredientsBindingSource;
            cbIngredients.SelectedIndex = -1;
            cbIngredients.ValueMember = "Id";
            cbIngredients.DisplayMember = "Name";
        }

        private void cbIngredients_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}

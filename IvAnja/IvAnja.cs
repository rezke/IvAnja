using System;
using System.Windows.Forms;
using DAL;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;

namespace IvAnja
{
    public partial class IvAnja : Form
    {
        IvAnjaEntities _context;
        private List<Ingredient> ingredients = new List<Ingredient>();
        BindingSource ingredientsBindingSource = new BindingSource();


        public IvAnja()
        {
            InitializeComponent();
            _context = new IvAnjaEntities();
            _context.Ingredients.Load();

            ingredientsBindingSource.DataSource = _context.Ingredients.Local.ToBindingList();
            lbIngredients.DataSource = ingredientsBindingSource;
            lbIngredients.DisplayMember = "Name";

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            Ingredient ingredient = new Ingredient();


            ingredient.Name = this.txtName.Text;
            _context.Ingredients.Add(ingredient);
            _context.SaveChanges();

            _context.Ingredients.Load();
            ingredientsBindingSource.ResetBindings(true);
            lbIngredients.Refresh();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            Ingredient selectedIngredient = new Ingredient();

            selectedIngredient = (Ingredient)lbIngredients.SelectedItem;
            Ingredient ingredientToDelete = _context.Ingredients.Find(selectedIngredient.Id);
            _context.Ingredients.Remove(ingredientToDelete);
            _context.SaveChanges();

            _context.Ingredients.Load();
            ingredientsBindingSource.ResetBindings(true);
            lbIngredients.Refresh();
        }

        private void brnEdit_Click(object sender, EventArgs e)
        {
            Ingredient selectedIngredient = new Ingredient();
          

            selectedIngredient = (Ingredient)lbIngredients.SelectedItem;
            Ingredient ingredientToEdit = _context.Ingredients.Find(selectedIngredient.Id);
            Ingredient newIngredient = new Ingredient();
            newIngredient.Name = txtName.Text;
            newIngredient.Id = selectedIngredient.Id;

            if (ingredientToEdit != null)
            {
                _context.Entry(ingredientToEdit).CurrentValues.SetValues(newIngredient);
                _context.SaveChanges();
            }         

            _context.Ingredients.Load();
            ingredientsBindingSource.ResetBindings(true);
            lbIngredients.Refresh();
        }
    }
}

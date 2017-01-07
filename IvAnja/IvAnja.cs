using System;
using System.Windows.Forms;
using DAL;

namespace IvAnja
{
    public partial class IvAnja : Form
    {
        public IvAnja()
        {
            InitializeComponent();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            Ingredient ingredient = new Ingredient();

           using (IvAnjaEntities db = new IvAnjaEntities())
            {
                ingredient.Name = this.txtName.Text;
                db.Ingredients.Add(ingredient);
                db.SaveChanges();
            }
        }
    }
}

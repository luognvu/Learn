private void button1_Click(object sender, EventArgs e)
        {
            string sName = textBox1.Text;
            int iPrice = Convert.ToInt32(textBox2.Text);
            bool updFlg = false;

            if (listView1.Items.Count > 0)
            {
                foreach (ListViewItem it in listView1.Items)
                {
                    if(it.Text == sName)
                    {
                        it.SubItems[2].Text = (Convert.ToInt32(it.SubItems[2].Text) + 1).ToString();
                        updFlg = true;
                    }
                }
            }
            if (!updFlg)
            {
                ListViewItem item = new ListViewItem();
                item.Text = sName;
                item.SubItems.Add(iPrice.ToString());
                item.SubItems.Add("1");
                listView1.Items.Add(item);
            }
        }

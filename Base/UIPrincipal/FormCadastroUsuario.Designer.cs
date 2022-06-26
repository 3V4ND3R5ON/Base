﻿
namespace UIPrincipal
{
    partial class FormCadastroUsuario
    {
        /// <summary>
        /// Variável de designer necessária.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpar os recursos que estão sendo usados.
        /// </summary>
        /// <param name="disposing">true se for necessário descartar os recursos gerenciados; caso contrário, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código gerado pelo Windows Form Designer

        /// <summary>
        /// Método necessário para suporte ao Designer - não modifique 
        /// o conteúdo deste método com o editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.Label idLabel;
            System.Windows.Forms.Label nomeUsuarioLabel;
            System.Windows.Forms.Label cpfLabel;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormCadastroUsuario));
            this.buttonSalvar = new System.Windows.Forms.Button();
            this.buttonSalvarECadastrarNovo = new System.Windows.Forms.Button();
            this.ativoCheckBox = new System.Windows.Forms.CheckBox();
            this.usuarioBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.textBoxId = new System.Windows.Forms.TextBox();
            this.textBoxNomeUsuario = new System.Windows.Forms.TextBox();
            this.textBoxCpf = new System.Windows.Forms.TextBox();
            this.buttonCancelarCadastro = new System.Windows.Forms.Button();
            idLabel = new System.Windows.Forms.Label();
            nomeUsuarioLabel = new System.Windows.Forms.Label();
            cpfLabel = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.usuarioBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // idLabel
            // 
            idLabel.AutoSize = true;
            idLabel.ForeColor = System.Drawing.Color.Black;
            idLabel.Location = new System.Drawing.Point(19, 122);
            idLabel.Name = "idLabel";
            idLabel.Size = new System.Drawing.Size(19, 13);
            idLabel.TabIndex = 6;
            idLabel.Text = "Id:";
            // 
            // nomeUsuarioLabel
            // 
            nomeUsuarioLabel.AutoSize = true;
            nomeUsuarioLabel.ForeColor = System.Drawing.Color.Black;
            nomeUsuarioLabel.Location = new System.Drawing.Point(90, 122);
            nomeUsuarioLabel.Name = "nomeUsuarioLabel";
            nomeUsuarioLabel.Size = new System.Drawing.Size(46, 13);
            nomeUsuarioLabel.TabIndex = 8;
            nomeUsuarioLabel.Text = "Usuario:";
            // 
            // cpfLabel
            // 
            cpfLabel.AutoSize = true;
            cpfLabel.ForeColor = System.Drawing.Color.Black;
            cpfLabel.Location = new System.Drawing.Point(525, 122);
            cpfLabel.Name = "cpfLabel";
            cpfLabel.Size = new System.Drawing.Size(26, 13);
            cpfLabel.TabIndex = 10;
            cpfLabel.Text = "Cpf:";
            // 
            // buttonSalvar
            // 
            this.buttonSalvar.Cursor = System.Windows.Forms.Cursors.Hand;
            this.buttonSalvar.FlatAppearance.BorderSize = 0;
            this.buttonSalvar.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Black;
            this.buttonSalvar.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent;
            this.buttonSalvar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonSalvar.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonSalvar.Image = ((System.Drawing.Image)(resources.GetObject("buttonSalvar.Image")));
            this.buttonSalvar.Location = new System.Drawing.Point(22, 517);
            this.buttonSalvar.Name = "buttonSalvar";
            this.buttonSalvar.Size = new System.Drawing.Size(40, 40);
            this.buttonSalvar.TabIndex = 3;
            this.buttonSalvar.UseVisualStyleBackColor = true;
            this.buttonSalvar.Click += new System.EventHandler(this.buttonSalvar_Click);
            // 
            // buttonSalvarECadastrarNovo
            // 
            this.buttonSalvarECadastrarNovo.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonSalvarECadastrarNovo.Location = new System.Drawing.Point(93, 526);
            this.buttonSalvarECadastrarNovo.Name = "buttonSalvarECadastrarNovo";
            this.buttonSalvarECadastrarNovo.Size = new System.Drawing.Size(226, 23);
            this.buttonSalvarECadastrarNovo.TabIndex = 4;
            this.buttonSalvarECadastrarNovo.Text = "SALVAR E CADASTRAR UM NOVO";
            this.buttonSalvarECadastrarNovo.UseVisualStyleBackColor = true;
            this.buttonSalvarECadastrarNovo.Click += new System.EventHandler(this.buttonSalvarECadastrarNovo_Click);
            // 
            // ativoCheckBox
            // 
            this.ativoCheckBox.DataBindings.Add(new System.Windows.Forms.Binding("CheckState", this.usuarioBindingSource, "Ativo", true));
            this.ativoCheckBox.ForeColor = System.Drawing.Color.Black;
            this.ativoCheckBox.Location = new System.Drawing.Point(711, 136);
            this.ativoCheckBox.Name = "ativoCheckBox";
            this.ativoCheckBox.Size = new System.Drawing.Size(52, 24);
            this.ativoCheckBox.TabIndex = 2;
            this.ativoCheckBox.Text = "Ativo";
            this.ativoCheckBox.UseVisualStyleBackColor = true;
            // 
            // usuarioBindingSource
            // 
            this.usuarioBindingSource.DataSource = typeof(Model.Usuario);
            // 
            // textBoxId
            // 
            this.textBoxId.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.usuarioBindingSource, "Id", true));
            this.textBoxId.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.textBoxId.Location = new System.Drawing.Point(22, 138);
            this.textBoxId.Name = "textBoxId";
            this.textBoxId.Size = new System.Drawing.Size(65, 20);
            this.textBoxId.TabIndex = 7;
            // 
            // textBoxNomeUsuario
            // 
            this.textBoxNomeUsuario.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.usuarioBindingSource, "NomeUsuario", true));
            this.textBoxNomeUsuario.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.textBoxNomeUsuario.Location = new System.Drawing.Point(93, 138);
            this.textBoxNomeUsuario.Name = "textBoxNomeUsuario";
            this.textBoxNomeUsuario.Size = new System.Drawing.Size(429, 20);
            this.textBoxNomeUsuario.TabIndex = 0;
            // 
            // textBoxCpf
            // 
            this.textBoxCpf.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.usuarioBindingSource, "Senha", true));
            this.textBoxCpf.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.textBoxCpf.Location = new System.Drawing.Point(528, 138);
            this.textBoxCpf.Name = "textBoxCpf";
            this.textBoxCpf.Size = new System.Drawing.Size(177, 20);
            this.textBoxCpf.TabIndex = 1;
            // 
            // buttonCancelarCadastro
            // 
            this.buttonCancelarCadastro.BackColor = System.Drawing.Color.White;
            this.buttonCancelarCadastro.Cursor = System.Windows.Forms.Cursors.Hand;
            this.buttonCancelarCadastro.FlatAppearance.BorderSize = 0;
            this.buttonCancelarCadastro.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Black;
            this.buttonCancelarCadastro.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent;
            this.buttonCancelarCadastro.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.buttonCancelarCadastro.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonCancelarCadastro.Location = new System.Drawing.Point(325, 526);
            this.buttonCancelarCadastro.Name = "buttonCancelarCadastro";
            this.buttonCancelarCadastro.Size = new System.Drawing.Size(82, 23);
            this.buttonCancelarCadastro.TabIndex = 3;
            this.buttonCancelarCadastro.Text = "CANCELAR";
            this.buttonCancelarCadastro.UseVisualStyleBackColor = false;
            this.buttonCancelarCadastro.Click += new System.EventHandler(this.buttonCancelarCadastro_Click);
            // 
            // FormCadastroUsuario
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(764, 561);
            this.Controls.Add(this.buttonCancelarCadastro);
            this.Controls.Add(cpfLabel);
            this.Controls.Add(this.textBoxCpf);
            this.Controls.Add(nomeUsuarioLabel);
            this.Controls.Add(this.textBoxNomeUsuario);
            this.Controls.Add(idLabel);
            this.Controls.Add(this.textBoxId);
            this.Controls.Add(this.ativoCheckBox);
            this.Controls.Add(this.buttonSalvarECadastrarNovo);
            this.Controls.Add(this.buttonSalvar);
            this.ForeColor = System.Drawing.Color.Black;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FormCadastroUsuario";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "CADASTRO DE USUARIO";
            ((System.ComponentModel.ISupportInitialize)(this.usuarioBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button buttonSalvar;
        private System.Windows.Forms.Button buttonSalvarECadastrarNovo;
        private System.Windows.Forms.BindingSource usuarioBindingSource;
        private System.Windows.Forms.CheckBox ativoCheckBox;
        private System.Windows.Forms.TextBox textBoxId;
        private System.Windows.Forms.TextBox textBoxNomeUsuario;
        private System.Windows.Forms.TextBox textBoxCpf;
        private System.Windows.Forms.Button buttonCancelarCadastro;
    }
}


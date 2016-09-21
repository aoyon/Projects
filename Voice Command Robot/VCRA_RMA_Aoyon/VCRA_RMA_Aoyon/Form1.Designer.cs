namespace VCRA_RMA_Aoyon
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.textBoxComPortNum = new System.Windows.Forms.TextBox();
            this.labelComPort = new System.Windows.Forms.Label();
            this.buttonCOMConnect = new System.Windows.Forms.Button();
            this.statusStrip = new System.Windows.Forms.StatusStrip();
            this.toolStripStatusLabel1 = new System.Windows.Forms.ToolStripStatusLabel();
            this.serialPort = new System.IO.Ports.SerialPort(this.components);
            this.richTextBoxVoiceRecog = new System.Windows.Forms.RichTextBox();
            this.buttonCOMDisConnect_Click = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.linkLabel1 = new System.Windows.Forms.LinkLabel();
            this.buttonRight = new System.Windows.Forms.Button();
            this.buttonLeft = new System.Windows.Forms.Button();
            this.buttonDown = new System.Windows.Forms.Button();
            this.buttonUp = new System.Windows.Forms.Button();
            this.buttonGrip = new System.Windows.Forms.Button();
            this.Dance = new System.Windows.Forms.Button();
            this.statusStrip.SuspendLayout();
            this.SuspendLayout();
            // 
            // textBoxComPortNum
            // 
            this.textBoxComPortNum.Location = new System.Drawing.Point(283, 204);
            this.textBoxComPortNum.Name = "textBoxComPortNum";
            this.textBoxComPortNum.Size = new System.Drawing.Size(34, 20);
            this.textBoxComPortNum.TabIndex = 0;
            this.textBoxComPortNum.Text = "2";
            this.textBoxComPortNum.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // labelComPort
            // 
            this.labelComPort.AutoSize = true;
            this.labelComPort.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelComPort.Location = new System.Drawing.Point(283, 188);
            this.labelComPort.Name = "labelComPort";
            this.labelComPort.Size = new System.Drawing.Size(34, 13);
            this.labelComPort.TabIndex = 1;
            this.labelComPort.Text = "COM";
            // 
            // buttonCOMConnect
            // 
            this.buttonCOMConnect.Location = new System.Drawing.Point(322, 188);
            this.buttonCOMConnect.Name = "buttonCOMConnect";
            this.buttonCOMConnect.Size = new System.Drawing.Size(72, 36);
            this.buttonCOMConnect.TabIndex = 2;
            this.buttonCOMConnect.Text = "Connect";
            this.buttonCOMConnect.UseVisualStyleBackColor = true;
            this.buttonCOMConnect.Click += new System.EventHandler(this.buttonCOMConnect_Click);
            // 
            // statusStrip
            // 
            this.statusStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLabel1});
            this.statusStrip.Location = new System.Drawing.Point(0, 296);
            this.statusStrip.Name = "statusStrip";
            this.statusStrip.Size = new System.Drawing.Size(400, 25);
            this.statusStrip.TabIndex = 3;
            this.statusStrip.Text = "statusStrip1";
            // 
            // toolStripStatusLabel1
            // 
            this.toolStripStatusLabel1.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
            this.toolStripStatusLabel1.Size = new System.Drawing.Size(190, 20);
            this.toolStripStatusLabel1.Text = "COM Port is not connected!";
            // 
            // richTextBoxVoiceRecog
            // 
            this.richTextBoxVoiceRecog.BackColor = System.Drawing.Color.Black;
            this.richTextBoxVoiceRecog.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.richTextBoxVoiceRecog.ForeColor = System.Drawing.Color.Lime;
            this.richTextBoxVoiceRecog.Location = new System.Drawing.Point(205, 230);
            this.richTextBoxVoiceRecog.Name = "richTextBoxVoiceRecog";
            this.richTextBoxVoiceRecog.Size = new System.Drawing.Size(189, 61);
            this.richTextBoxVoiceRecog.TabIndex = 4;
            this.richTextBoxVoiceRecog.Text = "COM Port is not Connected...";
            // 
            // buttonCOMDisConnect_Click
            // 
            this.buttonCOMDisConnect_Click.Location = new System.Drawing.Point(205, 188);
            this.buttonCOMDisConnect_Click.Name = "buttonCOMDisConnect_Click";
            this.buttonCOMDisConnect_Click.Size = new System.Drawing.Size(72, 36);
            this.buttonCOMDisConnect_Click.TabIndex = 5;
            this.buttonCOMDisConnect_Click.Text = "Disconnect";
            this.buttonCOMDisConnect_Click.UseVisualStyleBackColor = true;
            this.buttonCOMDisConnect_Click.Click += new System.EventHandler(this.buttonCOMDisConnect_Click_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.SystemColors.ControlLight;
            this.label1.Font = new System.Drawing.Font("Minion Pro SmBd", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(214, 60);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(161, 29);
            this.label1.TabIndex = 6;
            this.label1.Text = "Voice Controlled";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.SystemColors.ControlLight;
            this.label2.Font = new System.Drawing.Font("Minion Pro SmBd", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(234, 89);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(128, 29);
            this.label2.TabIndex = 7;
            this.label2.Text = "Robotic Arm";
            // 
            // linkLabel1
            // 
            this.linkLabel1.AutoSize = true;
            this.linkLabel1.BackColor = System.Drawing.SystemColors.ControlLight;
            this.linkLabel1.Location = new System.Drawing.Point(255, 129);
            this.linkLabel1.Name = "linkLabel1";
            this.linkLabel1.Size = new System.Drawing.Size(86, 13);
            this.linkLabel1.TabIndex = 8;
            this.linkLabel1.TabStop = true;
            this.linkLabel1.Text = "www.rmabd.com";
            // 
            // buttonRight
            // 
            this.buttonRight.Location = new System.Drawing.Point(12, 268);
            this.buttonRight.Name = "buttonRight";
            this.buttonRight.Size = new System.Drawing.Size(51, 23);
            this.buttonRight.TabIndex = 9;
            this.buttonRight.Text = "Right";
            this.buttonRight.UseVisualStyleBackColor = true;
            this.buttonRight.Click += new System.EventHandler(this.buttonRight_Click);
            // 
            // buttonLeft
            // 
            this.buttonLeft.Location = new System.Drawing.Point(12, 230);
            this.buttonLeft.Name = "buttonLeft";
            this.buttonLeft.Size = new System.Drawing.Size(51, 23);
            this.buttonLeft.TabIndex = 10;
            this.buttonLeft.Text = "Left";
            this.buttonLeft.UseVisualStyleBackColor = true;
            this.buttonLeft.Click += new System.EventHandler(this.buttonLeft_Click);
            // 
            // buttonDown
            // 
            this.buttonDown.Location = new System.Drawing.Point(81, 268);
            this.buttonDown.Name = "buttonDown";
            this.buttonDown.Size = new System.Drawing.Size(51, 23);
            this.buttonDown.TabIndex = 11;
            this.buttonDown.Text = "Down";
            this.buttonDown.UseVisualStyleBackColor = true;
            this.buttonDown.Click += new System.EventHandler(this.buttonDown_Click);
            // 
            // buttonUp
            // 
            this.buttonUp.Location = new System.Drawing.Point(81, 230);
            this.buttonUp.Name = "buttonUp";
            this.buttonUp.Size = new System.Drawing.Size(51, 23);
            this.buttonUp.TabIndex = 12;
            this.buttonUp.Text = "Up";
            this.buttonUp.UseVisualStyleBackColor = true;
            this.buttonUp.Click += new System.EventHandler(this.buttonUp_Click);
            // 
            // buttonGrip
            // 
            this.buttonGrip.Location = new System.Drawing.Point(148, 230);
            this.buttonGrip.Name = "buttonGrip";
            this.buttonGrip.Size = new System.Drawing.Size(51, 23);
            this.buttonGrip.TabIndex = 13;
            this.buttonGrip.Text = "Grip";
            this.buttonGrip.UseVisualStyleBackColor = true;
            this.buttonGrip.Click += new System.EventHandler(this.buttonGrip_Click);
            // 
            // Dance
            // 
            this.Dance.Location = new System.Drawing.Point(148, 268);
            this.Dance.Name = "Dance";
            this.Dance.Size = new System.Drawing.Size(51, 23);
            this.Dance.TabIndex = 14;
            this.Dance.Text = "Dance";
            this.Dance.UseVisualStyleBackColor = true;
            this.Dance.Click += new System.EventHandler(this.Dance_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::VCRA_RMA_Aoyon.Properties.Resources.iStock_000010456215XSmall1;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.ClientSize = new System.Drawing.Size(400, 321);
            this.Controls.Add(this.Dance);
            this.Controls.Add(this.buttonGrip);
            this.Controls.Add(this.buttonUp);
            this.Controls.Add(this.buttonDown);
            this.Controls.Add(this.buttonLeft);
            this.Controls.Add(this.buttonRight);
            this.Controls.Add(this.linkLabel1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.buttonCOMDisConnect_Click);
            this.Controls.Add(this.richTextBoxVoiceRecog);
            this.Controls.Add(this.statusStrip);
            this.Controls.Add(this.buttonCOMConnect);
            this.Controls.Add(this.labelComPort);
            this.Controls.Add(this.textBoxComPortNum);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Name = "Form1";
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Hide;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Voice Controlled Robotic Arm - RMA";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.statusStrip.ResumeLayout(false);
            this.statusStrip.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBoxComPortNum;
        private System.Windows.Forms.Label labelComPort;
        private System.Windows.Forms.Button buttonCOMConnect;
        private System.Windows.Forms.StatusStrip statusStrip;
        private System.IO.Ports.SerialPort serialPort;
        public System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel1;
        private System.Windows.Forms.RichTextBox richTextBoxVoiceRecog;
        private System.Windows.Forms.Button buttonCOMDisConnect_Click;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.LinkLabel linkLabel1;
        private System.Windows.Forms.Button buttonRight;
        private System.Windows.Forms.Button buttonLeft;
        private System.Windows.Forms.Button buttonDown;
        private System.Windows.Forms.Button buttonUp;
        private System.Windows.Forms.Button buttonGrip;
        private System.Windows.Forms.Button Dance;
    }
}


﻿namespace graphplotting1
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
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea1 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Legend legend1 = new System.Windows.Forms.DataVisualization.Charting.Legend();
            System.Windows.Forms.DataVisualization.Charting.Series series1 = new System.Windows.Forms.DataVisualization.Charting.Series();
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea2 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Legend legend2 = new System.Windows.Forms.DataVisualization.Charting.Legend();
            System.Windows.Forms.DataVisualization.Charting.Series series2 = new System.Windows.Forms.DataVisualization.Charting.Series();
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea3 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Legend legend3 = new System.Windows.Forms.DataVisualization.Charting.Legend();
            System.Windows.Forms.DataVisualization.Charting.Series series3 = new System.Windows.Forms.DataVisualization.Charting.Series();
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea4 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Legend legend4 = new System.Windows.Forms.DataVisualization.Charting.Legend();
            System.Windows.Forms.DataVisualization.Charting.Series series4 = new System.Windows.Forms.DataVisualization.Charting.Series();
            this.sensor1 = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.label1 = new System.Windows.Forms.Label();
            this.textBoxSerialPort = new System.Windows.Forms.TextBox();
            this.buttonSerialPortConn = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.buttonClearGraph = new System.Windows.Forms.Button();
            this.buttonSerialPortDC = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.serialPort1 = new System.IO.Ports.SerialPort(this.components);
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toolStripStatusLabel1 = new System.Windows.Forms.ToolStripStatusLabel();
            this.progressBar1 = new System.Windows.Forms.ToolStripProgressBar();
            this.sensor2 = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.sensor3 = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.sensor4 = new System.Windows.Forms.DataVisualization.Charting.Chart();
            ((System.ComponentModel.ISupportInitialize)(this.sensor1)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.statusStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.sensor2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sensor3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sensor4)).BeginInit();
            this.SuspendLayout();
            // 
            // sensor1
            // 
            this.sensor1.BorderlineColor = System.Drawing.SystemColors.ButtonFace;
            chartArea1.Name = "ChartArea1";
            this.sensor1.ChartAreas.Add(chartArea1);
            legend1.Name = "Legend1";
            this.sensor1.Legends.Add(legend1);
            this.sensor1.Location = new System.Drawing.Point(-18, 78);
            this.sensor1.Margin = new System.Windows.Forms.Padding(4);
            this.sensor1.Name = "sensor1";
            this.sensor1.Palette = System.Windows.Forms.DataVisualization.Charting.ChartColorPalette.Fire;
            series1.ChartArea = "ChartArea1";
            series1.ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Spline;
            series1.Legend = "Legend1";
            series1.Name = "Series1";
            this.sensor1.Series.Add(series1);
            this.sensor1.Size = new System.Drawing.Size(702, 321);
            this.sensor1.TabIndex = 0;
            this.sensor1.Text = "Sensor 1";
            this.sensor1.TextAntiAliasingQuality = System.Windows.Forms.DataVisualization.Charting.TextAntiAliasingQuality.SystemDefault;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(7, 28);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(89, 16);
            this.label1.TabIndex = 1;
            this.label1.Text = "Serial Port :";
            // 
            // textBoxSerialPort
            // 
            this.textBoxSerialPort.Location = new System.Drawing.Point(130, 24);
            this.textBoxSerialPort.Name = "textBoxSerialPort";
            this.textBoxSerialPort.Size = new System.Drawing.Size(23, 22);
            this.textBoxSerialPort.TabIndex = 2;
            this.textBoxSerialPort.Text = "2";
            this.textBoxSerialPort.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // buttonSerialPortConn
            // 
            this.buttonSerialPortConn.Location = new System.Drawing.Point(159, 23);
            this.buttonSerialPortConn.Name = "buttonSerialPortConn";
            this.buttonSerialPortConn.Size = new System.Drawing.Size(148, 23);
            this.buttonSerialPortConn.TabIndex = 3;
            this.buttonSerialPortConn.Text = "Connect";
            this.buttonSerialPortConn.UseVisualStyleBackColor = true;
            this.buttonSerialPortConn.Click += new System.EventHandler(this.buttonSerialPortConn_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.buttonClearGraph);
            this.groupBox1.Controls.Add(this.buttonSerialPortDC);
            this.groupBox1.Controls.Add(this.textBoxSerialPort);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.buttonSerialPortConn);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(654, 59);
            this.groupBox1.TabIndex = 4;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Serial Initializing";
            // 
            // buttonClearGraph
            // 
            this.buttonClearGraph.Location = new System.Drawing.Point(490, 23);
            this.buttonClearGraph.Name = "buttonClearGraph";
            this.buttonClearGraph.Size = new System.Drawing.Size(140, 23);
            this.buttonClearGraph.TabIndex = 7;
            this.buttonClearGraph.Text = "RePlot";
            this.buttonClearGraph.UseVisualStyleBackColor = true;
            this.buttonClearGraph.Click += new System.EventHandler(this.buttonClearGraph_Click);
            // 
            // buttonSerialPortDC
            // 
            this.buttonSerialPortDC.Location = new System.Drawing.Point(329, 23);
            this.buttonSerialPortDC.Name = "buttonSerialPortDC";
            this.buttonSerialPortDC.Size = new System.Drawing.Size(137, 23);
            this.buttonSerialPortDC.TabIndex = 6;
            this.buttonSerialPortDC.Text = "Disconnect";
            this.buttonSerialPortDC.UseVisualStyleBackColor = true;
            this.buttonSerialPortDC.Click += new System.EventHandler(this.buttonSerialPortDC_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(90, 27);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(44, 18);
            this.label2.TabIndex = 4;
            this.label2.Text = "COM";
            // 
            // serialPort1
            // 
            this.serialPort1.ErrorReceived += new System.IO.Ports.SerialErrorReceivedEventHandler(this.serialPort1_ErrorReceived);
            this.serialPort1.DataReceived += new System.IO.Ports.SerialDataReceivedEventHandler(this.serialPort1_DataReceived);
            // 
            // statusStrip1
            // 
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLabel1,
            this.progressBar1});
            this.statusStrip1.Location = new System.Drawing.Point(0, 666);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(695, 22);
            this.statusStrip1.TabIndex = 5;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // toolStripStatusLabel1
            // 
            this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
            this.toolStripStatusLabel1.Size = new System.Drawing.Size(122, 17);
            this.toolStripStatusLabel1.Text = "Connect to COM Port";
            // 
            // progressBar1
            // 
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(100, 16);
            // 
            // sensor2
            // 
            chartArea2.Name = "ChartArea1";
            this.sensor2.ChartAreas.Add(chartArea2);
            legend2.Name = "Legend1";
            this.sensor2.Legends.Add(legend2);
            this.sensor2.Location = new System.Drawing.Point(-18, 224);
            this.sensor2.Name = "sensor2";
            this.sensor2.Palette = System.Windows.Forms.DataVisualization.Charting.ChartColorPalette.Berry;
            series2.ChartArea = "ChartArea1";
            series2.ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Line;
            series2.Legend = "Legend1";
            series2.Name = "Series1";
            this.sensor2.Series.Add(series2);
            this.sensor2.Size = new System.Drawing.Size(702, 326);
            this.sensor2.TabIndex = 12;
            this.sensor2.Text = "chart1";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(532, 95);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.textBox1.Size = new System.Drawing.Size(134, 548);
            this.textBox1.TabIndex = 13;
            // 
            // sensor3
            // 
            chartArea3.Name = "ChartArea1";
            this.sensor3.ChartAreas.Add(chartArea3);
            legend3.Name = "Legend1";
            this.sensor3.Legends.Add(legend3);
            this.sensor3.Location = new System.Drawing.Point(-18, 371);
            this.sensor3.Name = "sensor3";
            series3.ChartArea = "ChartArea1";
            series3.ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Line;
            series3.Legend = "Legend1";
            series3.Name = "Series1";
            this.sensor3.Series.Add(series3);
            this.sensor3.Size = new System.Drawing.Size(702, 322);
            this.sensor3.TabIndex = 14;
            this.sensor3.Text = "chart1";
            // 
            // sensor4
            // 
            chartArea4.Name = "ChartArea1";
            this.sensor4.ChartAreas.Add(chartArea4);
            legend4.Name = "Legend1";
            this.sensor4.Legends.Add(legend4);
            this.sensor4.Location = new System.Drawing.Point(-18, 518);
            this.sensor4.Name = "sensor4";
            this.sensor4.Palette = System.Windows.Forms.DataVisualization.Charting.ChartColorPalette.Excel;
            series4.ChartArea = "ChartArea1";
            series4.ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Line;
            series4.Legend = "Legend1";
            series4.Name = "Series1";
            this.sensor4.Series.Add(series4);
            this.sensor4.Size = new System.Drawing.Size(702, 306);
            this.sensor4.TabIndex = 15;
            this.sensor4.Text = "chart1";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(695, 688);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.sensor4);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.sensor3);
            this.Controls.Add(this.sensor2);
            this.Controls.Add(this.sensor1);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Graphing";
            this.TopMost = true;
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            ((System.ComponentModel.ISupportInitialize)(this.sensor1)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.sensor2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sensor3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sensor4)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataVisualization.Charting.Chart sensor1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBoxSerialPort;
        private System.Windows.Forms.Button buttonSerialPortConn;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.IO.Ports.SerialPort serialPort1;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel1;
        private System.Windows.Forms.ToolStripProgressBar progressBar1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button buttonSerialPortDC;
        private System.Windows.Forms.Button buttonClearGraph;
        private System.Windows.Forms.DataVisualization.Charting.Chart sensor2;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.DataVisualization.Charting.Chart sensor3;
        private System.Windows.Forms.DataVisualization.Charting.Chart sensor4;

    }
}


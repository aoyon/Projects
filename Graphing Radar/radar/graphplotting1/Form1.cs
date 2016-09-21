using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms.DataVisualization.Charting;
using System.Windows.Forms;
using System.Threading;


namespace graphplotting1
{
    public partial class Form1 : Form
    {
        int maxVal=100, minVal=0;
        bool firstRun1 = true;
        int r;
        string sData;
        string[] sensors;
        public Form1()
        {
            InitializeComponent();
            loadGraph();
        }

        public void loadGraph()
        {
            sensor1.ChartAreas.Add("first");
            sensor1.Series.Add("sensor1YValue");
            sensor1.Series["sensor1YValue"].ChartType = SeriesChartType.Polar;
        }

        private void buttonSerialPortConn_Click(object sender, EventArgs e)
        {
            try
            {
                if (!serialPort1.IsOpen)
                {
                    serialPort1.PortName = string.Format("COM{0}", textBoxSerialPort.Text);
                    serialPort1.Open();
                    serialPort1.ReadTimeout = 500;
                    if (serialPort1.IsOpen)
                    {
                        progressBar1.Value = 100;
                        toolStripStatusLabel1.Text = string.Format("COM{0} has Opened : Ready to Use", textBoxSerialPort.Text);
                    }
                    if (!serialPort1.IsOpen)
                    {
                        progressBar1.Value = 0;
                        toolStripStatusLabel1.Text = "Failed to Initialize Ports";
                    }
                }
            }

            catch (Exception)
            {
                MessageBox.Show(String.Format("COM{0} is not available", textBoxSerialPort.Text));
            }
        }

        private void buttonSerialPortDC_Click(object sender, EventArgs e)
        {
            try
            {
                if (serialPort1.IsOpen)
                {
                    serialPort1.Close();
                    if (serialPort1.IsOpen)
                    {
                        progressBar1.Value = 0;
                        toolStripStatusLabel1.Text = string.Format("COM{0} failed to close", textBoxSerialPort.Text);
                    }
                    if (!serialPort1.IsOpen)
                    {
                        progressBar1.Value = 100;
                        toolStripStatusLabel1.Text = string.Format("COM {0} has close", textBoxSerialPort.Text);
                        sensor1.Series["sensor1YValue"].Points.Clear();
                    }
                }
            }

            catch (Exception)
            {
                MessageBox.Show(String.Format("COM{0} failed to close", textBoxSerialPort.Text));
            }
        }

        private void serialPort1_ErrorReceived(object sender, System.IO.Ports.SerialErrorReceivedEventArgs e)
        {
            try
            {
                serialPort1.Close();
                if (serialPort1.IsOpen)
                {
                    progressBar1.Value = 0;
                    toolStripStatusLabel1.Text = string.Format("COM{0} failed to close", textBoxSerialPort.Text);
                }
                if (!serialPort1.IsOpen)
                {
                    progressBar1.Value = 100;
                    toolStripStatusLabel1.Text = string.Format("COM{0} has close", textBoxSerialPort.Text);
                    sensor1.Series["sensor1YValue"].Points.Clear();
                }
            }

            catch (Exception)
            {
                MessageBox.Show(String.Format("COM{0} failed to close", textBoxSerialPort.Text));
            }
        }

        private void serialPort1_DataReceived(object sender, System.IO.Ports.SerialDataReceivedEventArgs e)
        {
            try
            {
                sData = serialPort1.ReadLine();
                sensors = sData.Split('*');
                UpdateAnalog1(sensors[0]);
            }

            catch (TimeoutException)
            {
                MessageBox.Show("Timed Out!");
            }
        } 
        
        delegate void UpdateAnalog1Delegate(string analogVal);

        void UpdateAnalog1(string analogVal)
        {
            if (InvokeRequired)
            {
                Invoke(new UpdateAnalog1Delegate(UpdateAnalog1), analogVal);
                return;
            }
            
            int progVal;

            try
            {
                
                if (int.TryParse(analogVal, out progVal))
                {
                    if (firstRun1)
                    {
                        sensor1.Series["sensor1YValue"].Points.AddXY(0,120);
                        sensor1.Series["sensor1YValue"].Points.AddXY(1, 120);
                        for (int i = 2; i <= 358; i++)
                        {
                            sensor1.Series["sensor1YValue"].Points.AddXY(i,0);
                        }
                        firstRun1 = false;
                    }
                    if (sensor1.Series["sensor1YValue"].Points.Count() >= 360)
                        sensor1.Series["sensor1YValue"].Points.RemoveAt(0);
                    r++;
                    if (r >= 360) r = 0;
                    label3.Text = string.Format("Distance:{0}cm", analogVal);
                    sensor1.Series["sensor1YValue"].Points.AddXY(r, progVal);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("WOW! Somwthing went wrong 1");
            }
        }

        

        private void buttonClearGraph_Click(object sender, EventArgs e)
        {
            sensor1.Series["sensor1YValue"].Points.Clear();
            sensor1.Series["sensor1YValue"].Points.AddY(maxVal);
            for (int i = 1; i < 99; i++)
            {
                sensor1.Series["sensor1YValue"].Points.AddY(minVal);
            }

            toolStripStatusLabel1.Text = "Graphics Area Cleared";

        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            System.Environment.Exit(System.Environment.ExitCode);
        }
    }
}

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
        public Form1()
        {
            InitializeComponent();
            loadGraph();
        }

        public void loadGraph()
        {
            sensor1.ChartAreas.Add("first");
            sensor1.Series.Add("sensor1YValue");
            sensor1.Series["sensor1YValue"].ChartType = SeriesChartType.Line;

            sensor1.ChartAreas["first"].AxisY.Maximum = 700;
            sensor1.ChartAreas["first"].AxisY.Minimum = 300;
            sensor1.ChartAreas["first"].AxisY.Interval=1;
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
                        toolStripStatusLabel1.Text = string.Format("COM{0} has close", textBoxSerialPort.Text);
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
            string sData;
            Int32 sDataval;
            try
            {
                sData = serialPort1.ReadLine();
                //sDataval = Convert.ToInt32(sData);
                UpdateAnalog(sData);
            }

            catch (TimeoutException)
            {
                MessageBox.Show("Timed Out!");
            }
        } 
        
        delegate void UpdateAnalogDelegate(string analogVal);

        void UpdateAnalog(string analogVal)
        {
            if (InvokeRequired)
            {
                Invoke(new UpdateAnalogDelegate(UpdateAnalog), analogVal);
                return;
            }
            
            int progVal;

            try
            {
                if (int.TryParse(analogVal, out progVal))
                {
                    label3.Text = string.Format("Sensor Value : {0}", analogVal);
                    sensor1.Series["sensor1YValue"].Points.AddY(analogVal);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("WOW! Somwthing went wrong");
            }
        }


        private void buttonClearGraph_Click(object sender, EventArgs e)
        {
            sensor1.Series["sensor1YValue"].Points.Clear();
            toolStripStatusLabel1.Text = "Graphics Area Cleared";
        }
    }
}

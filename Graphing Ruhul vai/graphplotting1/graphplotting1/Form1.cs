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
        int maxVal=400, minVal=0;
        bool firstRun1 = true;
        bool firstRun2 = true;
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
            sensor1.Series["sensor1YValue"].ChartType = SeriesChartType.Line;

            sensor2.ChartAreas.Add("second");
            sensor2.Series.Add("sensor2YValue");
            sensor2.Series["sensor2YValue"].ChartType = SeriesChartType.Line;
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
                        sensor2.Series["sensor2YValue"].Points.Clear();
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
                //UpdateAnalog2(sensors[1]);
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
                        sensor1.Series["sensor1YValue"].Points.AddY(maxVal);
                        for (int i = 1; i < 99; i++)
                        {
                            sensor1.Series["sensor1YValue"].Points.AddY(minVal);
                        }
                        firstRun1 = false;
                    }
                    if (sensor1.Series["sensor1YValue"].Points.Count() >= 100)
                        sensor1.Series["sensor1YValue"].Points.RemoveAt(0);
                    label3.Text = string.Format("Temperature :{0}", analogVal);
                    textBox1.AppendText(string.Format("{0}  , ", analogVal));
                    sensor1.Series["sensor1YValue"].Points.AddY(analogVal);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("WOW! Somwthing went wrong 1");
            }
        }

        delegate void UpdateAnalog2Delegate(string analogVal);

        void UpdateAnalog2(string analogVal)
        {
            if (InvokeRequired)
            {
                Invoke(new UpdateAnalog2Delegate(UpdateAnalog2), analogVal);
                return;
            }

            int progVal;

            try
            {

                if (int.TryParse(analogVal, out progVal))
                {
                    //label4.Text = string.Format("Sensor Value : {0}", analogVal);

                    if (firstRun2)
                    {
                        sensor2.Series["sensor2YValue"].Points.AddY(maxVal);
                        for (int i = 1; i < 99; i++)
                        {
                            sensor2.Series["sensor2YValue"].Points.AddY(minVal);
                        }
                        firstRun2 = false;
                    }

                    if (sensor2.Series["sensor2YValue"].Points.Count() >= 100)
                        sensor2.Series["sensor2YValue"].Points.RemoveAt(0);
                    label4.Text = string.Format("Temperature :{0}", analogVal);
                    textBox1.AppendText(string.Format("   {0}", analogVal + Environment.NewLine));
                    sensor2.Series["sensor2YValue"].Points.AddY(analogVal);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("WOW! Somwthing went wrong 2");
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
            sensor2.Series["sensor2YValue"].Points.Clear();
            sensor2.Series["sensor2YValue"].Points.AddY(maxVal);
            for (int i = 1; i < 99; i++)
            {
                sensor2.Series["sensor2YValue"].Points.AddY(minVal);
            }
            textBox1.Text = "";
            toolStripStatusLabel1.Text = "Graphics Area Cleared";

        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            System.Environment.Exit(System.Environment.ExitCode);
        }
    }
}

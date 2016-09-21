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
        int l,s;
        int BPM = 0;
        int maxVal=50, minVal=0;
        bool firstRun1 = true;
        bool firstRun2 = true;
        bool plotting = false;
        string sData;
        int units;
        int bill;
        int lastData = 0;
        int[] maxData;
        string[] sensors;

        public Form1()
        {
            InitializeComponent();
        }

        void connect()
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
                        toolStripStatusLabel1.Text = string.Format("COM{0} <-->", textBoxSerialPort.Text);
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
                toolStripStatusLabel1.Text = string.Format("COM {0} Error", textBoxSerialPort.Text );
            }
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
                sensors = sData.Split('s');
                unitsofem(sensors[0]);
                billsofem(sensors[1]);
            }

            catch (TimeoutException)
            {
                MessageBox.Show("Timed Out!");
            }
        }

        delegate void unitsofemDelegate(string analogVal);

        void unitsofem(string analogVal)
        {
            if (InvokeRequired)
            {
                Invoke(new unitsofemDelegate(unitsofem), analogVal);
                return;
            }
            try
            {
                label3.Text = analogVal;
            }
            catch (Exception)
            {
                MessageBox.Show("WOW! Somwthing went wrong 1");
            }
        }

        delegate void billsofemDelegate(string analogVal);

        void billsofem(string analogVal)
        {
            if (InvokeRequired)
            {
                Invoke(new billsofemDelegate(billsofem), analogVal);
                return;
            }
            try
            {
                label9.Text = analogVal;
            }
            catch (Exception)
            {
                MessageBox.Show("WOW! Somwthing went wrong 1");
            }
        }
       

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            System.Environment.Exit(System.Environment.ExitCode);
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            connect();
        }
        
    }
}

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
using System.Diagnostics;


namespace rfidTest
{
    public partial class Form1 : Form
    {
        
        string RFID;
        int browsers;
        public Form1()
        {
            InitializeComponent();
        }


        private void buttonSerialPortConn_Click(object sender, EventArgs e)
        {
            try
            {
                if (!serialPort1.IsOpen)
                {
                    serialPort1.ReadBufferSize = 8;
                    serialPort1.PortName = string.Format("COM{0}", textBoxSerialPort.Text);
                    serialPort1.Open();
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
                RFID = serialPort1.ReadTo("??");
                RFID = RFID.Replace("?", "3");
                RFID = RFID.Replace("&", "1");
                UpdatePHPPage(RFID);
            }

            catch (TimeoutException)
            {
                MessageBox.Show("Timed Out!");
            }
        }

        delegate void UpdatePHPPageDelegate(string RFID_Val);

        void UpdatePHPPage(string RFID_Val)
        {
            if (InvokeRequired)
            {
                Invoke(new UpdatePHPPageDelegate(UpdatePHPPage), RFID_Val);
                return;
            }
            
            try
            {
                string rfidVal = RFID_Val;
                if (RFID != "")
                {
                    textBox1.AppendText(RFID_Val + Environment.NewLine);
                    if (browsers == 0)
                        Process.Start("IExplore.exe", "http://localhost/RFID/login.php?id=" + rfidVal);
                    else if (browsers == 1)
                        Process.Start("chrome.exe", "http://localhost/RFID/login.php?id=" + rfidVal);
                    else
                        Process.Start("firefox.exe", "http://localhost/RFID/login.php?id=" + rfidVal);
                }
                
            }
            catch (Exception)
            {
                browsers++;
                if (browsers > 1)
                    browsers = 0;
                MessageBox.Show("WOW! Somwthing went wrong ");
            }
        }

    }
}

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
        int analog;
        int sampleData;
        int lastData = 0;
        int[] maxData;
        string[] sensors;
        int m = 100;
        int n;
        objective c = new objective();
        timeDifference BPMtime = new timeDifference();

        public Form1()
        {
            InitializeComponent();
            loadGraph();
            s = c.cx(0);
        }

        public void loadGraph()
        {
            sensor1.ChartAreas.Add("first");
            sensor1.Series.Add("sensor1YValue");
            sensor1.Series["sensor1YValue"].ChartType = SeriesChartType.Line;

            
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
                        sensor1.Series["sensor1YValue"].Points.AddY(maxVal);
                        
                        for (int i = 1; i < 99; i++)
                        {
                            sensor1.Series["sensor1YValue"].Points.AddY(minVal);
                        }
                        firstRun1 = false;
                    }
                    if (sensor1.Series["sensor1YValue"].Points.Count() >= 100)
                        sensor1.Series["sensor1YValue"].Points.RemoveAt(0);
                    textBox1.AppendText(string.Format("{0}      {1}", analogVal,n) + Environment.NewLine);
                    sensor1.Series["sensor1YValue"].Points.AddY(analogVal);
                    if (progVal >= 20)
                        plotting = true;
                }
            }
            catch (Exception)
            {
                MessageBox.Show("WOW! Somwthing went wrong 1");
            }
        }

        public int sampleBPMDatas(int _analog)
        {
            for (int i = 0; i < 99; i++)
            {
                _analog++;
            }
            return (int)_analog / 100;
        }

        public void calcBPM(int _obj, int[] _ar)
        {
            int fq = 0;
            for (int i = 0; i < m; i++)
            {
                fq++;
                BPMtime.timeStart();
                sampleData = _obj;
                if (sampleData > lastData)
                    maxData[i] = sampleData;
                sampleData = lastData;
                BPMtime.timeEnd();
            }
            for (int i = 0; i < m; i++)
            {
                _ar[i] = BPMtime.timeStart() - BPMtime.timeEnd();
            }
            for (int i = 0; i < m; i++)
            {
                BPM += _ar[i];
                if (i == m)
                    BPM = BPM / m;
            }
            label8.Text = "Heart Rate : " + BPM.ToString();
        }
       

        private void buttonClearGraph_Click(object sender, EventArgs e)
        {
            sensor1.Series["sensor1YValue"].Points.Clear();
            sensor1.Series["sensor1YValue"].Points.AddY(maxVal);
            for (int i = 1; i < 99; i++)
            {
                sensor1.Series["sensor1YValue"].Points.AddY(minVal);
            }
           
           
            textBox1.Text = "";
            toolStripStatusLabel1.Text = "Graphics Area Cleared";

        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            System.Environment.Exit(System.Environment.ExitCode);
        }

        

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (plotting == true)
            {
                l++;
                if(s == 0)
                    n = c.cx(1);
                else if(s == 1)
                    n = c.cx(2);
                else if (s == 2)
                    n = c.cx(3);
                else if (s == 3)
                    n = c.cx(4);
                else
                    n = c.cx(5);
                label3.Text = n.ToString();
            }
            if (l >= 30)
            {
                plotting = false;
                l = 0;
                s = c.cx(0);
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Speech.Recognition;

namespace VCRA_RMA_Aoyon
{
    public partial class Form1 : Form
    {
        public string vc;
        
        public Form1()
        {
            InitializeComponent();
        }


        private void buttonCOMConnect_Click(object sender, EventArgs e)
        {
            try
            {
                if (!serialPort.IsOpen)
                {
                    serialPort.PortName = string.Format("COM{0}", textBoxComPortNum.Text.ToString());
                    serialPort.Open();
                    serialPort.ReadTimeout = 500;
                    if (serialPort.IsOpen)
                    {
                        toolStripStatusLabel1.Text = string.Format("COM{0} has Opened : Ready to Use", textBoxComPortNum.Text.ToString());
                        richTextBoxVoiceRecog.AppendText(System.Environment.NewLine + string.Format("COM{0} has Opened : Ready to Use", textBoxComPortNum.Text.ToString()));
                    }
                    if (!serialPort.IsOpen)
                    {
                        toolStripStatusLabel1.Text = "Failed to Initialize Ports";
                    }
                }
                else
                {
                    if (textBoxComPortNum.Modified == false)
                    {
                        toolStripStatusLabel1.Text = string.Format("COM{0} is Already Opened", textBoxComPortNum.Text.ToString());
                    }

                    if (textBoxComPortNum.Modified == true)
                    {
                        serialPort.Close();
                        serialPort.PortName = string.Format("COM{0}", textBoxComPortNum.Text.ToString());
                        serialPort.Open();
                        if (serialPort.IsOpen)
                        {
                            toolStripStatusLabel1.Text = string.Format("COM{0} has Opened : Ready to Use", textBoxComPortNum.Text.ToString());
                        }
                        if (!serialPort.IsOpen)
                        {
                            toolStripStatusLabel1.Text = "Failed to Initialize Ports";
                        }
                    }
                }
            }

            catch (Exception)
            {
                MessageBox.Show(String.Format("COM{0} is not available", textBoxComPortNum.Text.ToString()));
                toolStripStatusLabel1.Text = String.Format("COM{0} is not available", textBoxComPortNum.Text.ToString());
            }
        }

        private void buttonCOMDisConnect_Click_Click(object sender, EventArgs e)
        {
            serialPort.Close();
            if (!serialPort.IsOpen)
            {
                toolStripStatusLabel1.Text = string.Format("COM{0} has Closed", textBoxComPortNum.Text.ToString());
                richTextBoxVoiceRecog.AppendText(System.Environment.NewLine + string.Format("COM{0} has Closed", textBoxComPortNum.Text.ToString()));
            }

            else
            {
                toolStripStatusLabel1.Text = string.Format("Failed to close COM{0}", textBoxComPortNum.Text.ToString());
                richTextBoxVoiceRecog.AppendText(System.Environment.NewLine + string.Format("Failed to close COM{0}", textBoxComPortNum.Text.ToString()));
            }
        }


        private void Form1_Load(object sender, EventArgs e)
        {
            SpeechRecognizer RMAVoiceRecognizerEngine = new SpeechRecognizer();
            Choices voiceCommands = new Choices();
            voiceCommands.Add(new string[] { "left", "right", "up", "down", "grip", "dance" });
            GrammarBuilder commandGrammerBuilder = new GrammarBuilder();
            commandGrammerBuilder.Append(voiceCommands);
            Grammar commandGrammer = new Grammar(commandGrammerBuilder);
            RMAVoiceRecognizerEngine.LoadGrammar(commandGrammer);
            RMAVoiceRecognizerEngine.SpeechRecognized += new EventHandler<SpeechRecognizedEventArgs>(RMAVoiceRecognizerEngine_SpeechRecognized);
        }


        void RMAVoiceRecognizerEngine_SpeechRecognized(object sender, SpeechRecognizedEventArgs e)
        {
            richTextBoxVoiceRecog.AppendText(System.Environment.NewLine + "Command : " + e.Result.Text); 
            if (serialPort.IsOpen)
            {
                switch (e.Result.Text)
                {
                    case "left":
                        sendCommandToRoboticArm("l");
                        break;
                    case "right":
                        sendCommandToRoboticArm("r");
                        break;
                    case "up":
                        sendCommandToRoboticArm("u");
                        break;
                    case "down":
                        sendCommandToRoboticArm("d");
                        break;
                    case "grip":
                        sendCommandToRoboticArm("g");
                        break;
                    case "dance":
                        sendCommandToRoboticArm("a");
                        break;
                    default:
                        break;
                }
            }

        }

        public void sendCommandToRoboticArm(string command)
        {
            try
            {
                serialPort.WriteLine(command);
                richTextBoxVoiceRecog.AppendText(System.Environment.NewLine + "Command : " + command);
                toolStripStatusLabel1.Text = command + " Command Sent !";
            }
            catch (Exception)
            {
                richTextBoxVoiceRecog.AppendText(System.Environment.NewLine + "Command : " + command);
                MessageBox.Show(string.Format("COM{0} is not open! Failed to send command to robotic arm",textBoxComPortNum.Text.ToString()));
                toolStripStatusLabel1.Text = command + " Command Not Sent !";
            }
        }

        private void buttonLeft_Click(object sender, EventArgs e)
        {
            sendCommandToRoboticArm("l");
        }

        private void buttonRight_Click(object sender, EventArgs e)
        {
            sendCommandToRoboticArm("r");
        }

        private void buttonUp_Click(object sender, EventArgs e)
        {
            sendCommandToRoboticArm("u");
        }

        private void buttonDown_Click(object sender, EventArgs e)
        {
            sendCommandToRoboticArm("d");
        }

        private void buttonGrip_Click(object sender, EventArgs e)
        {
            sendCommandToRoboticArm("g");
        }

        private void Dance_Click(object sender, EventArgs e)
        {
            sendCommandToRoboticArm("a");
        }

    }
}

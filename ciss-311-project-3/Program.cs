/// Group Members:
///     Brodzinski, Isabell
///     McDonald, Brandon
///     Morton, Amanda
///     Roseboro, Charles
///     Smith, Eric
/// 
/// CISS 311
/// Advanced Agile Development
/// Saturday, February 2nd, 2019
/// 
/// Project Three - Tiny Library

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ciss_311_project_3
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new MainForm());
        }
    }
}

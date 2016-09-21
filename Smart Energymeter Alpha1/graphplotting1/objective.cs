using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace graphplotting1
{
    class objective
    {
        Random RND = new Random();
        int from,to;
        public int cx(int cond)
        {
            if (cond == 0)
            {
                from = 0;
                to = 4;
            }
            if (cond == 1)
            {
                from = 73;
                to = 85;
            }
            if (cond == 2)
            {
                from = 80;
                to = 87;
            }
            if (cond == 3)
            {
                from = 82;
                to = 92;
            }
            if (cond == 4)
            {
                from = 73;
                to = 87;
            }
            if (cond == 5)
            {
                from = 77;
                to = 84;
            }
            return RND.Next(from, to);
        }
    }
}

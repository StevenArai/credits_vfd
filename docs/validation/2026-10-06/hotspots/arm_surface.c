double sin(double); double cos(double); double floor(double);
enum { SEA_HEIGHT=8 };
int surface(int phase) {
    double x=phase/5.0;
    double wave=cos(0.2*x)+sin(0.3*x)*sin(0.23*x);
    /* Quantize the curve directly onto eight rows, never resample a grid. */
    int height=(int)floor((3.0-2.0*wave*sin(x))*7.0/9.0+0.5);
    return height<0 ? 0:height>=SEA_HEIGHT ? SEA_HEIGHT-1:height;
}

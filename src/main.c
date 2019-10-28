#include <screen.h>
#include <keypad.h>
#include <handle_events.h>
#include <handle_events.h>

#define TO_STR(ch) ((((ch) >= 0) && ((ch) <= 9)) ? (48 + (ch)) : ('a' + ((ch)-10)))



#define UP 0
#define DOWN 1
#define LEFT 2
#define RIGHT 3
#define COMING_UP 4
#define COMING_DOWN 5


uint8_t fgColor, bgColor;

Object loc,locat;
SpiderObj spider;

void paintSpider()
{


    loc.x = 18;
    loc.y = 44;
     set_color(WHITE, BLACK);
    set_cursor(loc.x,loc.y);
    put_char(8);
    int k = 10;

   do{

    put_char(8);    
    loc.x++;
         set_cursor(locat.x, locat.y);
    put_char(89);
    delay_ms(100);


    } while(k!=0);




}



void player(){

     locat.x=14;
    locat.y=38;
    set_cursor(locat.x, locat.y);
    put_char(89);
    uint8_t k ;
    keypad_init();
    paintSpider();

    while (1)
    {

       k= keypad_getkey();

       //up
        if (k == 4 && locat.x > 0 )
        {       

       set_cursor(locat.x, locat.y);
        put_char(255);
         locat.x--;
                  
        }
        //down
        if(k==3 && locat.x < 29){
              set_cursor(locat.x, locat.y);
            put_char(255);
             locat.x++;

        }
        //left
        if(k == 1  && locat.y > 0){

            set_cursor(locat.x, locat.y);
            put_char(255);
             locat.y--;
        }

        //right
        if(k == 2 && locat.y < 79){

              set_cursor(locat.x, locat.y);
            put_char(255);
             locat.y++;
        }

          set_cursor(locat.x, locat.y);
    put_char(89);
    delay_ms(100);
        
    }

    



}





int main()
{
    clear_screen();
    set_color(WHITE, BLACK);

    player();
    paintSpider();
 
   

    //clear_screen();
    //set_color(WHITE, BLACK);
    //set_cursor(29, 15);
    /* put_char('H');
    put_char('e');
    put_char('l');
    put_char('l');
    put_char('o');
    put_char('!'); */
    //puts("Hello!");

    /*
    uint8_t f, b;
    get_color(&f, &b);
    
    set_color(RED, BLACK);
    puts("\x1\x2");
    set_color(f, b);
    
    keypad_init();
    while (1) {
        uint8_t k = keypad_getkey();
        set_cursor(2, 1);
        put_char(TO_STR(k & 0xf));
        set_cursor(3, 1);
        put_char(TO_STR((k & 0xf0) >> 4));
        if (k != 0) {
            set_cursor(10, 15);
            puts("Key press");
        }
    }
*/
    return 0;
}

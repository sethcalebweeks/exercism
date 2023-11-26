#include <cmath>
using namespace std;

namespace targets {

    class Alien
    {
    private:
        int health = 3;
    public:
        int x_coordinate, y_coordinate;

        Alien(int x, int y)
        {
            x_coordinate = x;
            y_coordinate = y;
        }

        int get_health()
        {
            return health;
        }

        bool hit()
        {
            health = max(0, health - 1);
            return true;
        }

        bool is_alive()
        {
            return health > 0;
        }

        bool teleport(int x, int y)
        {
            x_coordinate = x;
            y_coordinate = y;
            return true;
        }

        bool collision_detection(Alien alien)
        {
            return alien.x_coordinate == x_coordinate && alien.y_coordinate == y_coordinate;
        }

    };
        

}  // namespace targets
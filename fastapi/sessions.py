from fastapi import APIRouter

router = APIRouter()

@router.get("/menu")
def menu():
    return {
        "items": [
            {"name": "Veg Burger", "price": 40},
            {"name": "Chicken Roll", "price": 60},
            {"name": "Cold Coffee", "price": 30}
        ]
    }

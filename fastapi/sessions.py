from fastapi import APIRouter


router = APIRouter()


@router.get("/menu/{rid}")
def menu(rid: int):
    return {
"items": [
{"id": 1, "name": "Chicken samosa", "price": 25},
{"id": 2, "name": "Dosa", "price": 25},
{"id": 3, "name": "Idly", "price": 25},
{"id": 4, "name": "Milk", "price": 25}
]
}
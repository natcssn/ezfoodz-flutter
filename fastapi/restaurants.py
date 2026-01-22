from fastapi import APIRouter


router = APIRouter()


@router.get("/restaurants")
def restaurants():
    return {
"restaurants": [
{"id": 1, "name": "Main Canteen", "rating": 4.2},
{"id": 2, "name": "South Mess", "rating": 4.5},
{"id": 3, "name": "Night Canteen", "rating": 4.0},
{"id": 4, "name": "Juice Corner", "rating": 4.6},
]
}
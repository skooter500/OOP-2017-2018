using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Tank1 : MonoBehaviour
{

    public float rotationSpeed = 180f;
    public float moveSpeed = 20.0f;

    // Making things public means that Unity can see them
    public GameObject bulletSpawnPoint;
    public GameObject bulletPrefab;
    
    // Use this for initialization
    void Start()
    {
    }

    // Update is called once per frame
    void Update()
    {

      
        if (Input.GetKey(KeyCode.I))
        {
            // Move forwards
            transform.Translate(0, 0, moveSpeed * Time.deltaTime);
        }
        if (Input.GetKey(KeyCode.K))
        {
            // Move backwards
            transform.Translate(0, 0, -moveSpeed * Time.deltaTime);
        }
        if (Input.GetKey(KeyCode.J))
        {
            // Rotate counterclockwise
            transform.Rotate(0, -rotationSpeed * Time.deltaTime, 0);
        }
        if (Input.GetKey(KeyCode.L))
        {
            // Rotate clockwise
            transform.Rotate(0, rotationSpeed * Time.deltaTime, 0);
        }

        if (Input.GetKeyDown(KeyCode.Return))
        {
            // Create a bullet from the bulletprefab
            GameObject bullet = GameObject.Instantiate<GameObject>(bulletPrefab);

            // Set its starting position and rotation
            bullet.transform.position = bulletSpawnPoint.transform.position;
            bullet.transform.rotation = transform.rotation;

        }
    }
}
